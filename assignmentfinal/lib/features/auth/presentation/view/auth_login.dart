import 'package:flutter/material.dart';
import 'package:assignmentfinal/core/widgets/custom_button.dart';
import 'package:assignmentfinal/core/widgets/custom_textfield.dart';
import 'package:assignmentfinal/features/auth/presentation/view/auth_register.dart';
import 'package:assignmentfinal/features/auth/presentation/view_model/auth_service.dart';

// enum Auth {
//   signin,
//   signup,
// }

class AuthLogin extends StatefulWidget {
  static const String routeName = '/authlogin';
  const AuthLogin({Key? key}) : super(key: key);

  @override
  State<AuthLogin> createState() => _AuthLoginState();
}

class _AuthLoginState extends State<AuthLogin> {
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController =
      TextEditingController(text: "samyog@gmail.com");
  final TextEditingController _passwordController =
      TextEditingController(text: "samyog");
  final TextEditingController _usernameController = TextEditingController();
  bool isObscure = true;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _usernameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 36, 91),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: Form(
            key: _signInFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
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
                  height: 30,
                ),
                Container(
                  height: screenHeight * .04,
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
                  height: screenHeight * .07,
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
                  height: screenHeight * .07,
                  child: CustomTextField(
                    key: const Key('password_field'),
                    controller: _passwordController,
                    hintText: 'Enter Password',
                    icon: Icons.password,
                    obscureText: true,
                    showSuffixIcon:
                        true, // Show the suffix icon only for the password field
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
                    height: screenHeight * .06,
                    width: screenWidth * 1,
                    child: CustomButton(
                      color: const Color.fromARGB(255, 53, 208, 94),
                      text: 'Sign In',
                      onTap: () {
                        if (_signInFormKey.currentState!.validate()) {
                          signInUser();
                        }
                      },
                    )),
                const SizedBox(
                  // width: double.infinity,
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AuthRegister.routeName);
                  },
                  child: const Center(
                    child: Text(
                      "Don't have an account?   Sign Up",
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
