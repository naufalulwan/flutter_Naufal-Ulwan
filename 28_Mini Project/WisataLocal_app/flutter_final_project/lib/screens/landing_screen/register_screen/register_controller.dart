import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_final_project/constants/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/common.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  String name = '';
  String email = '';
  String password = '';
  String passwordConfirm = '';

  var isLoading = false.obs;
  var isPasswordHidden1 = true.obs;
  var isPasswordHidden2 = true.obs;

  CollectionReference userDataBaseReference =
      FirebaseFirestore.instance.collection("user");

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
  }

  String? validName(String value) {
    if (value.length < 3) {
      return "Minimal harus 3 karakter";
    }
    return null;
  }

  String? validEmail(String value) {
    if (!GetUtils.isEmail(value.trim())) {
      return "Email yang dimasukan tidak valid";
    }
    return null;
  }

  String? validPassword(String value) {
    if (value.length < 6) {
      return "Password harus berisi minimal 6 karakter";
    }
    return null;
  }

  String? validPasswordConfirm(String value) {
    if (value != passwordController.text) {
      print(
        passwordController.text,
      );
      print(value);
      return 'Password harus sama';
    }
    return null;
  }

  Future<void> registration() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    isLoading.value = true;

    formKey.currentState!.save();

    userRegister(email.trim(), password.toString().trim()).then((credentials) {
      isLoading.value = false;
    });
  }

  Future<UserCredential?> userRegister(String email, String password) async {
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        if (value != null) {
          User? user = FirebaseAuth.instance.currentUser;
          await user!.sendEmailVerification();
          snackMessage('Cek Email kamu');
          saveDataToDb().then((value) async {
            print('oke');
            Get.offNamed(RouteName.loginScreen);
          });
          return;
        }
      });
    } on FirebaseAuthException catch (e) {
      snackMessage('Pengguna telah ada');
    } catch (e) {}
    return userCredential;
  }

  Future<void> saveDataToDb() async {
    User? user = FirebaseAuth.instance.currentUser;
    await userDataBaseReference.doc(user!.uid).set({
      'uid': user.uid,
      'name': name,
      'email': email,
      'url': '',
      'contributor': false,
    });
  }
}
