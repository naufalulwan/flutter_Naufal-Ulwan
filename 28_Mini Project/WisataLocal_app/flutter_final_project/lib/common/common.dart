import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void snackMessage(msg) {
  Get.snackbar("Notifikasi", msg,
      snackPosition: SnackPosition.TOP, margin: const EdgeInsets.all(16));
}
