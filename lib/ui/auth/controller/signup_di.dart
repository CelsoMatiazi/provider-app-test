import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_controller.dart';
import '/data/repositories/auth_repository.dart';
import '../signup/signup_screen.dart';


class SignupDI{

  SignupDI._();

  static Widget get page => MultiProvider(
    providers:  [
      ChangeNotifierProvider(create: (context) =>
          AuthController(AuthRepository(client: context.read()))
      ),
    ],
    builder: (context, _){
      return const SignupScreen();
    });
}


