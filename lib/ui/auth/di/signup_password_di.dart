import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/data/repositories/auth_repository.dart';
import '/ui/auth/controller/signup_password_controller.dart';
import '/ui/auth/signup/signup_password_screen.dart';
import '/services/auth_services/auth_service_signup.dart';


class SignupPasswordDI{

  SignupPasswordDI._();

  static Widget get page => MultiProvider(
      providers:  [
        ChangeNotifierProvider(create: (context) =>
            SignupPasswordController(AuthServiceSignup(AuthRepository(
                client: context.read()
            )))
        ),
      ],
      builder: (context, _){
        return const SignupPasswordScreen();
      });
}