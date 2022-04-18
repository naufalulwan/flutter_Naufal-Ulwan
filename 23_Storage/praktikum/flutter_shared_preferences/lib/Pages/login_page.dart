import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Pages/home_page.dart';
import '../widgets/button.dart';
import '../widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  late SharedPreferences loginData;

  @override
  void initState() {
    super.initState();
    checkLogin();

    super.initState();
    _emailController.addListener(() {
      setState(() {});
    });

    _passwordController.addListener(() {
      setState(() {});
    });
  }

  String? get _errorTextEmail {
    final textEmail = _emailController.value.text;
    if (textEmail.isEmpty) {
      return 'Cant be empty';
    }
    return null;
  }

  String? get _errorTextPassword {
    final textPassword = _passwordController.value.text;
    if (textPassword.isEmpty) {
      return 'Cant be empty';
    }
    return null;
  }

  late bool newUser;
  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = loginData.getBool('login') ?? true;

    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _submitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Input(
                controller: _emailController,
                hintText: 'Masukan Email',
                labelText: 'Email',
                errorText: _submitted ? _errorTextEmail : null,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 15,
              ),
              Input(
                controller: _passwordController,
                obscureText: true,
                hintText: 'Masukan Password',
                labelText: 'Password',
                errorText: _submitted ? _errorTextPassword : null,
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ButtonInput(
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: _emailController.value.text.isNotEmpty &&
                            _passwordController.value.text.isNotEmpty
                        ? () => _submit()
                        : null),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submit() async {
    setState(() => _submitted = true);

    String email = _emailController.text;
    if (_errorTextEmail == null && _errorTextPassword == null) {
      await Future.delayed(Duration(milliseconds: 100));
      (_) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Berhasil Login')));
      };
      loginData.setBool('login', false);
      loginData.setString('email', email);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    }
  }
}
