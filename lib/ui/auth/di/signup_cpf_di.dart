import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/services/auth_services/auth_service_signup.dart';
import '/data/repositories/auth_repository.dart';
import '../controller/signup_cpf_controller.dart';
import '../signup_cpf_screen.dart';


class SignupCpfDI{

  SignupCpfDI._();

  static Widget get page => MultiProvider(
    providers:  [
      ChangeNotifierProvider(create: (context) =>
          SignupCpfController(AuthServiceSignup(AuthRepository(
              client: context.read()
          )))
      ),
    ],
    builder: (context, _){
      return const SignupCpfScreen();
    });
}


