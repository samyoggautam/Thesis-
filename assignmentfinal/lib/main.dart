import 'config/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignmentfinal/config/router.dart';
import 'package:assignmentfinal/core/widgets/bottom_bar.dart';
import 'package:assignmentfinal/core/provider/user_provider.dart';
import 'package:assignmentfinal/features/auth/presentation/view/auth_login.dart';
import 'package:assignmentfinal/features/admin/presentation/view/admin_screen.dart';
import 'package:assignmentfinal/features/auth/presentation/view_model/auth_service.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hiking app',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 0, 255, 8),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 16, 73, 230),
          ),
        ),
        useMaterial3: true, // can remove this line
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'admin'
              ? const AdminScreen() // Open AdminScreen for admin users
              : const BottomBar() // Open BottomBar for regular users
          : const AuthLogin(), // Show SplashView for unauthenticated users
    );
  }
}

// Route<dynamic> generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case '/actual-home':
//       return MaterialPageRoute(
//         builder: (context) => const BottomBar(),
//       );
//     // Add more routes here if needed
//     default:
//       // Handle unknown routes
//       return MaterialPageRoute(
//         builder: (context) => const Scaffold(
//           body: Center(
//             child: Text('404 Not Found'),
//           ),
//         ),
//       );
//   }
// }
