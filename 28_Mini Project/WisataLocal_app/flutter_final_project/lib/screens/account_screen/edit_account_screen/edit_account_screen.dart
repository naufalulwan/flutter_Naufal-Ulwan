import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_final_project/constants/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../landing_screen/components/text_field.dart';
import '../account_controller.dart';

class EditAccountScreen extends StatelessWidget {
  EditAccountScreen({Key? key}) : super(key: key);
  final AccountController _accountController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.offNamed(RouteName.accountScreen);
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
          height: MediaQuery.of(context).size.height / 1.8,
          child: Card(
            elevation: 4,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Padding(
                padding: const EdgeInsets.only(top: 20),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(children: [
                Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      border: _accountController.userData.value.status == false
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
                    child: _accountController.isLoading.isFalse
                        ? _accountController.selectedImagePath.value != ''
                            ? CircleAvatar(
                                backgroundImage: FileImage(File(
                                    _accountController
                                        .selectedImagePath.value)),
                                radius: 55,
                              )
                            : _accountController.userData.value.url != ''
                                ? CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        _accountController.userData.value.url
                                            .toString()),
                                    radius: 55,
                                  )
                                : const CircleAvatar(
                                    radius: 55,
                                    backgroundImage:
                                        AssetImage('assets/images/people.jpg'),
                                  )
                        : CircleAvatar(
                            radius: 55,
                            child: LoadingAnimationWidget.threeArchedCircle(
                                color: Colors.white, size: 30),
                          )),
                Container(
                  width: 130,
                  padding: const EdgeInsets.only(left: 80, top: 70),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(10)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 17,
                    ),
                    onPressed: () {
                      _accountController.getImage(ImageSource.gallery);
                    },
                  ),
                ),
              ]),
              const SizedBox(
                height: 35,
              ),
              Input(
                labelText: 'Nama',
                controller: _accountController.nameController,
                icon: const Icon(Icons.person),
                hintText: 'Ganti nama profile kamu',
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.greenAccent)),
                  child: _accountController.isLoading.value
                      ? LoadingAnimationWidget.prograssiveDots(
                          color: Colors.white, size: 35)
                      : const Text(
                          'Simpan',
                          style: TextStyle(color: Colors.white),
                        ),
                  onPressed: () {
                    _accountController.updateProfile(
                        _accountController.userData.value.url ?? '');
                    _accountController.clearImage();
                  },
                ),
              ),
              TextButton(onPressed: () {}, child: Text('Ganti Password')),
            ]),
          ),
        ),
      ),
    );
  }
}
