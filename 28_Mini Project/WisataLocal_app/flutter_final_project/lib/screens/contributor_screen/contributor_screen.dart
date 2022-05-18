import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_final_project/screens/account_screen/account_controller.dart';
import 'package:flutter_final_project/screens/contributor_screen/text.dart';
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
        title: const Text('Kontributor'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Obx(() => _accountController.contributor.value == false
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 1.02,
                        height: MediaQuery.of(context).size.height / 1.4,
                        child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 15, left: 15, bottom: 12, top: 12),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    "Syarat dan Ketentuan",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    txt1().toString(),
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    txt2().toString(),
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    txt3().toString(),
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Apakah anda ingin menjadi kontributor ?'),
                    const SizedBox(
                      height: 9,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.dialog(AlertDialog(
                          title: const Text(
                            'Apakah anda yakin?',
                            style: TextStyle(fontSize: 16),
                          ),
                          actions: [
                            MaterialButton(
                              onPressed: (() => Get.back()),
                              child: const Text('Tidak'),
                            ),
                            MaterialButton(
                              onPressed: (() => Get.back(result: true)),
                              child: const Text('Ya'),
                            ),
                          ],
                        )).then((exit) async {
                          if (exit == null) return;
                          if (exit) {
                            print('ya');
                            _accountController.contributor.value =
                                !_accountController.contributor.value;
                            _accountController.updateContributor();
                          } else {
                            print('tidak');
                          }
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.greenAccent)),
                      child: const Text(
                        'Ya saya ingin',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            : const Text('Anda telah menjadi kontributor, silahkan kembali')),
      ),
    );
  }
}
