import 'package:assignmentfinal/core/widgets/custom_button.dart';
import 'package:assignmentfinal/core/widgets/custom_textfield.dart';
import 'package:assignmentfinal/features/auth/presentation/view/auth_login.dart';
import 'package:assignmentfinal/features/auth/presentation/view_model/auth_service.dart';
import 'package:flutter/material.dart';

// enum Auth {
//   signin,
//   signup,
// }

class AuthRegister extends StatefulWidget {
  static const String routeName = '/authRegister';
  const AuthRegister({Key? key}) : super(key: key);

  @override
  State<AuthRegister> createState() => _AuthRegisterState();
}

class _AuthRegisterState extends State<AuthRegister> {
  final _signUpFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool isObscure = true;

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _usernameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 36, 91),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: Form(
            key: _signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.fill,
                      height: 170,
                      width: 250,
                    )),
                const SizedBox(
                  // width: double.infinity,
                  height: 50,
                ),
                Container(
                  height: height * .04,
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  child: const Text(
                    'UserName',
                    style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(0, 233, 239, 255),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: height * .07,
                  child: CustomTextField(
                    key: const Key('username_field'),
                    controller: _usernameController,
                    hintText: 'Enter Username',
                    icon: Icons.person,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: height * .04,
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  child: const Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFFe9efff),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: height * .07,
                  child: CustomTextField(
                    key: const Key('email_field'),
                    controller: _emailController,
                    hintText: 'Enter Email',
                    icon: Icons.email,
                  ),
                ),
                const SizedBox(
                  // width: double.infinity,
                  height: 30,
                ),
                const Text('Password',
                    style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFFe9efff),
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: height * .07,
                  child: CustomTextField(
                    key: const Key('password_field'),
                    controller: _passwordController,
                    hintText: 'Enter Password',
                    icon: Icons.password,
                  ),
                ),
                const SizedBox(
                  // width: double.infinity,
                  height: 30,
                ),
                const SizedBox(
                  // width: double.infinity,
                  height: 35,
                ),
                SizedBox(
                  height: height * .07,
                  width: width * 1,
                  child: CustomButton(
                    text: 'Sign Up',
                    color: const Color.fromARGB(255, 53, 208, 58),
                    onTap: () {
                      if (_signUpFormKey.currentState!.validate()) {
                        signUpUser();
                      }
                    },
                  ),
                ),
                const SizedBox(
                  // width: double.infinity,
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AuthLogin.routeName);
                  },
                  child: const Center(
                    child: Text(
                      "Back to Login",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFe9efff)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
