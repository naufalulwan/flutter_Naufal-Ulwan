import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_final_project/constants/routes/route_name.dart';
import 'login_controller.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../components/text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginController _loginController = Get.put(LoginController());

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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        height: MediaQuery.of(context).size.height - 200,
        width: double.infinity,
        child: Form(
          key: _loginController.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text(
                    "Masuk ke Akun",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Langsung masuk aja kalo kamu sudah punya akun",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                ],
              ),
              Column(
                children: [
                  Input(
                    controller: _loginController.emailController,
                    hintText: 'Masukan Email',
                    labelText: 'Email',
                    icon: const Icon(Icons.person),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      _loginController.email = value!;
                    },
                    validator: (value) {
                      return _loginController.validEmail(value!);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(
                    () => Stack(alignment: Alignment.centerRight, children: [
                      Input(
                        controller: _loginController.passwordController,
                        obscureText: _loginController.isPasswordHidden.value,
                        hintText: 'Masukan Password',
                        labelText: 'Password',
                        icon: const Icon(Icons.vpn_key),
                        keyboardType: TextInputType.visiblePassword,
                        onSaved: (value) {
                          _loginController.password = value!;
                        },
                        validator: (value) {
                          return _loginController.validPassword(value!);
                        },
                      ),
                      IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          _loginController.isPasswordHidden.value =
                              !_loginController.isPasswordHidden.value;
                        },
                        icon: const Icon(
                          Icons.visibility,
                          color: Colors.black54,
                        ),
                      ),
                    ]),
                  ),
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
                      color: Colors.greenAccent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () {
                        log(_loginController.isLoading.value.toString());
                        _loginController.isLoading.value
                            ? null
                            : _loginController.login();
                      },
                      child: FittedBox(
                        child: Obx(
                          () => _loginController.isLoading.value
                              ? Center(
                                  child: LoadingAnimationWidget.prograssiveDots(
                                      color: Colors.white, size: 35),
                                )
                              : const Text(
                                  'Masuk',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Kamu belum punya akun?"),
                      TextButton(
                        style: const ButtonStyle(enableFeedback: false),
                        onPressed: () {
                          Get.offNamed(RouteName.registerScreen);
                        },
                        child: const Text(
                          "Daftar dulu",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
