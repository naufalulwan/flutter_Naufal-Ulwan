import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/common.dart';
import '../../models/user_model.dart';

class AccountController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('user');
  final FirebaseStorage _storage = FirebaseStorage.instance;

  TextEditingController nameController = TextEditingController();

  var userData = UserModel().obs;

  var isImgAvailable = false.obs;
  final _picker = ImagePicker();
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  var contributor = false.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    try {
      final getUser = await users.doc(user!.uid).get();
      final getUserData = getUser.data() as Map<String, dynamic>;

      userData(UserModel.fromJson(getUserData));
    } catch (error) {
      print(error);
    }
    userData.refresh();
  }

  void clearImage() {
    selectedImagePath.value = '';
    selectedImageSize.value = '';
    isImgAvailable.value = false;
  }

  void getImage(ImageSource imageSource) async {
    var pickedFile = await _picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
      isImgAvailable.value = true;
    } else {
      isImgAvailable.value = false;
      snackMessage("Tidak ada gambar yang dipilih");
    }
  }

  Future<String?> uploadFile(filePath) async {
    File file = File(filePath);
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    String randomStr = String.fromCharCodes(Iterable.generate(
        8, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    try {
      await _storage
          .ref('uploads/user/profile/${user?.uid}/$randomStr')
          .putFile(file);
    } on FirebaseException catch (e) {
      snackMessage(e.code.toString());
    }
    String downloadURL = await _storage
        .ref('uploads/user/profile/${user?.uid}/$randomStr')
        .getDownloadURL();

    return downloadURL;
  }

  void updateProfile(String argUrl) {
    if (nameController.text == '') {
      nameController.text = userData.value.name!;
    }

    // ignore: unrelated_type_equality_checks
    if (isImgAvailable == true) {
      isLoading.value = true;
      uploadFile(selectedImagePath.value).then((url) {
        if (url != null) {
          users.doc(user!.uid).update({
            'uid': user?.uid,
            'name': nameController.text,
            'url': url,
          });
          userData.update((userData) {
            userData!.name = nameController.value.text;
            userData.url = url;
          });
          snackMessage("Akun profile telah berhasil dirubah");
        } else {
          snackMessage("Image not Uploaded");
        }
        isLoading.value = false;
      });
    } else {
      users.doc(user!.uid).update({
        'uid': user?.uid,
        'name': nameController.text,
      });
      userData.update((userData) {
        userData!.name = nameController.value.text;
        userData.url = argUrl == "" ? '' : argUrl;
      });
      snackMessage("Akun profile telah berhasil dirubah");
      isLoading.value = false;
    }
  }

  void updateContributor() {
    User? user = FirebaseAuth.instance.currentUser;
    if (contributor.value == true) {
      users.doc(user!.uid).update({'contributor': contributor.value});
      userData.update((userData) {
        userData!.status = contributor.value;
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
  }
}
