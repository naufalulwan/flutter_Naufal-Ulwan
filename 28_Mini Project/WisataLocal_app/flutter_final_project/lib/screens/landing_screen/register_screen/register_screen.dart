import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_final_project/constants/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../components/text_field.dart';
import 'register_controller.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final RegisterController _registrationController =
      Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 100,
          width: double.infinity,
          child: Form(
            key: _registrationController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      "Daftar akun",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Daftar akun kamu dulu yuk sebelum masuk",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Input(
                      controller: _registrationController.nameController,
                      hintText: 'Masukan Nama',
                      labelText: 'Nama',
                      icon: const Icon(Icons.person),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        _registrationController.name = value!;
                      },
                      validator: (value) {
                        return _registrationController.validName(value!);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Input(
                      controller: _registrationController.emailController,
                      hintText: 'Masukan Email',
                      labelText: 'Email',
                      icon: const Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        _registrationController.email = value!;
                      },
                      validator: (value) {
                        return _registrationController.validEmail(value!);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return Column(
                        children: [
                          Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Input(
                                controller:
                                    _registrationController.passwordController,
                                obscureText: _registrationController
                                    .isPasswordHidden1.value,
                                hintText: 'Masukan Password',
                                labelText: 'Password',
                                icon: const Icon(Icons.vpn_key),
                                keyboardType: TextInputType.visiblePassword,
                                onSaved: (value) {
                                  _registrationController.password = value!;
                                },
                                validator: (value) {
                                  return _registrationController
                                      .validPassword(value!);
                                },
                              ),
                              IconButton(
                                splashRadius: 20,
                                onPressed: () {
                                  _registrationController
                                          .isPasswordHidden1.value =
                                      !_registrationController
                                          .isPasswordHidden1.value;
                                },
                                icon: const Icon(
                                  Icons.visibility,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Stack(alignment: Alignment.centerRight, children: [
                            Input(
                              controller: _registrationController
                                  .passwordConfirmController,
                              obscureText: _registrationController
                                  .isPasswordHidden2.value,
                              hintText: 'Masukan Password sebelumnya',
                              labelText: 'Ulangi Password',
                              icon: const Icon(Icons.vpn_key_outlined),
                              keyboardType: TextInputType.visiblePassword,
                              onSaved: (value) {
                                _registrationController.passwordConfirm =
                                    value!;
                              },
                              validator: (value) {
                                return _registrationController
                                    .validPasswordConfirm(value!);
                              },
                            ),
                            IconButton(
                              splashRadius: 20,
                              onPressed: () {
                                _registrationController
                                        .isPasswordHidden2.value =
                                    !_registrationController
                                        .isPasswordHidden2.value;
                              },
                              icon: const Icon(
                                Icons.visibility,
                                color: Colors.black54,
                              ),
                            ),
                          ]),
                        ],
                      );
                    })
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: const Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          _registrationController.isLoading.value
                              ? null
                              : _registrationController.registration();
                        },
                        color: Colors.yellowAccent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: FittedBox(
                          child: Obx(
                            () => _registrationController.isLoading.value
                                ? Center(
                                    child:
                                        LoadingAnimationWidget.prograssiveDots(
                                            color: Colors.black, size: 35),
                                  )
                                : const Text(
                                    'Daftar',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Kamu sudah punya akun?"),
                        TextButton(
                          style: const ButtonStyle(enableFeedback: false),
                          onPressed: () {
                            Get.offNamed(RouteName.loginScreen);
                          },
                          child: const Text(
                            "langsung masuk",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
