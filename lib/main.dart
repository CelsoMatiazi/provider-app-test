
import 'package:flutter/material.dart';
import 'package:untitled/ui/auth/login_screen.dart';
import 'package:untitled/ui/auth/auth_options.dart';
import '/dependence_injection/dependence_injection.dart';
import '/ui/auth/controller/signup_di.dart';
import '/ui/constants/app_themes.dart';


void main() {
  runApp(
      const DependenceInjection(
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const AuthOptionsScreen(),
      //home: const UiTest(),

      routes: {
        "/signup" : (context) => SignupDI.page,
        "/login" : (context) => const LoginScreen(),
      },
    );
  }
}
