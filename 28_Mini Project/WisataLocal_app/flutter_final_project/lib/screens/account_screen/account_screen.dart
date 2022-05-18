import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_final_project/constants/routes/route_name.dart';
import 'package:flutter_final_project/screens/account_screen/account_controller.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);

  final AccountController _accountController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      floatingActionButton: _accountController.userData.value.status == true
          ? FloatingActionButton(
              backgroundColor: Colors.greenAccent,
              child: const Icon(
                Icons.add,
              ),
              onPressed: () {
                Get.toNamed(RouteName.addTourScreen);
              },
            )
          : null,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
            _accountController.clearImage();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Obx(
        () => SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.7,
          child: Card(
            elevation: 4,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          border: _accountController.userData.value.status ==
                                  false
                              ? Border.all(width: 2, color: Colors.yellowAccent)
                              : Border.all(width: 2, color: Colors.green),
                          // shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 2),
                          ],
                        ),
                        child: _accountController.userData.value.url == ''
                            ? const CircleAvatar(
                                backgroundColor: Colors.yellow,
                                backgroundImage:
                                    AssetImage('assets/images/people.jpg'),
                                radius: 40,
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.yellow,
                                backgroundImage: NetworkImage(_accountController
                                    .userData.value.url
                                    .toString()),
                                radius: 40,
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 22),
                        child: _accountController.userData.value.name != null &&
                                _accountController.userData.value.email != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _accountController.userData.value.name
                                        .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    _accountController.userData.value.email
                                        .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ],
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Text('Akun Status :'),
                    _accountController.userData.value.status == false
                        ? const Text(
                            'Bukan Kontributor',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.yellowAccent),
                          )
                        : const Text(
                            'Kontributor',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.yellow)),
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Get.offNamed(RouteName.editAccountScreen);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
