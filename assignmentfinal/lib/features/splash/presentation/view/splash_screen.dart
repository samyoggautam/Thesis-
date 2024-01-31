import 'package:flutter/material.dart';
import 'package:assignmentfinal/features/auth/presentation/view/auth_login.dart';

class SplashView extends StatefulWidget {
  static const String routeName = '/splash';

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AuthLogin.routeName,
        (route) => false,
      );
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 64, 64, 234),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                  width: 200,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 20),
                const CircularProgressIndicator(
                  color: Color(0xFFe9efff),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Version: 0.1.0',
                  style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFFe9efff),
                      fontFamily: 'Montserrat'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
