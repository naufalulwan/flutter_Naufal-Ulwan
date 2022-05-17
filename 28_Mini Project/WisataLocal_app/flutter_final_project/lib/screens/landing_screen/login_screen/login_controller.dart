import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/constants/routes/route_name.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var email = '';
  var password = '';
  var isLoading = false.obs;
  var isPasswordHidden = true.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onClose() {
    super.onClose();

    emailController.dispose();
    passwordController.dispose();
  }

  String? validEmail(String value) {
    if (!GetUtils.isEmail(value.trim())) {
      return "Masukan Email yang valid";
    }
    return null;
  }

  String? validPassword(String value) {
    if (value.length < 6) {
      return "Password minimal harus 6 karakter";
    }
    return null;
  }

  Future<void> login() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    isLoading.value = true;

    formKey.currentState!.save();

    try {
      await _auth
          .signInWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((value) async {
        if (value != null) {
          User? user = FirebaseAuth.instance.currentUser;
          if (!user!.emailVerified) {
            snackMessage('Email belum di verifikasi');
            return;
          }
          Get.offAllNamed(RouteName.mainScreen);
        } else {
          snackMessage("Pengguna tidak ditemukan");
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        snackMessage("Pengguna tidak ditemukan");
      } else if (e.code == 'wrong-password') {
        snackMessage("Password yang dimasukan tidak sesuai");
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
