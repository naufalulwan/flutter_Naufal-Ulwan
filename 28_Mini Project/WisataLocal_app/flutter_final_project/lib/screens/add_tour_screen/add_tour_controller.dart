import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/models/tour_model.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/common.dart';

class AddTourController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference tourDataReference =
      FirebaseFirestore.instance.collection('tour');
  final FirebaseStorage _storage = FirebaseStorage.instance;

  TextEditingController nameTourController = TextEditingController();
  TextEditingController statusTourController = TextEditingController();
  TextEditingController captTourController = TextEditingController();

  final List<String> statusChoice = [
    'Buka',
    'Tutup',
  ];

  var tourData = TourModel().obs;

  var editProfile = false.obs;

  var isImgAvailable = false.obs;
  final _picker = ImagePicker();
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  var currentChoice = 'Buka'.obs;

  @override
  void onInit() {
    super.onInit();
    statusTourController.text = currentChoice.value;
  }

  updatChoice(String value) {
    if (value != currentChoice) {
      currentChoice.value = value;
    }
    statusTourController.text = currentChoice.value;
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
          .ref('uploads/user/tour/$user.uid/$randomStr')
          .putFile(file);
    } on FirebaseException catch (e) {
      snackMessage(e.code.toString());
    }
    String downloadURL = await _storage
        .ref('uploads/user/tour/$user.uid/$randomStr')
        .getDownloadURL();

    return downloadURL;
  }

  void postTour() async {
    uploadFile(selectedImagePath.value).then((url) async {
      await tourDataReference.doc().set({
        'uid': user?.uid,
        'name': nameTourController.value.text,
        'caption': captTourController.value.text,
        'status': statusTourController.value.text,
        'url': url,
        'createdAt': DateTime.now(),
      });
    });
  }

  void clearImage() {
    selectedImagePath.value = '';
    selectedImageSize.value = '';
    isImgAvailable.value = false;
  }

  @override
  void onClose() {
    super.onClose();

    nameTourController.dispose();
    statusTourController.dispose();
    captTourController.dispose();
  }
}
