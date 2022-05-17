import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_final_project/screens/account_screen/account_controller.dart';
import 'package:get/get.dart';

class ContributorScreen extends StatelessWidget {
  ContributorScreen({Key? key}) : super(key: key);

  final AccountController _accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    log(_accountController.contributor.value.toString());
    log(_accountController.userData.value.status.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contributor'),
      ),
      body: Center(
        child: Obx(() => _accountController.contributor.value == false
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Apakah anda ingin menjadi kontributor ?'),
                  TextButton(
                    onPressed: () {
                      _accountController.contributor.value =
                          !_accountController.contributor.value;
                      _accountController.updateContributor();
                    },
                    child: const Text('Ya saya ingin'),
                  ),
                ],
              )
            : const Text('Anda telah menjadi kontributor')),
      ),
    );
  }
}
