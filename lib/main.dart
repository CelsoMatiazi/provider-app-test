
import 'package:flutter/material.dart';
import 'package:untitled/ui/auth/di/signup_password_di.dart';
import 'package:untitled/ui/auth/login_screen.dart';
import 'package:untitled/ui/auth/auth_options.dart';
import '/dependence_injection/dependence_injection.dart';
import 'ui/auth/di/signup_cpf_di.dart';
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

      routes: {
        "/signupCpf" : (context) => SignupCpfDI.page,
        "/signupPassword" : (context) => SignupPasswordDI.page,
        "/login" : (context) => const LoginScreen(),
      },
    );
  }
}
