import 'dart:developer';

import 'package:flutter/material.dart';
import '/data/models/signup_model.dart';
import '/ui/components/custom_app_bar.dart';
import '/ui/constants/colors.dart';
import '/ui/auth/components/new_password_page.dart';
import '/ui/utils/app_messages.dart';
import '/ui/utils/loader.dart';
import '../controller/auth_controller.dart';
import '../../constants/app_state.dart';
import '../../components/success_screen.dart';

class SignupPasswordScreen extends StatefulWidget {

  final AuthController controller;

  const SignupPasswordScreen({
    super.key,
    required this.controller
  });

  @override
  State<SignupPasswordScreen> createState() => _SignupPasswordScreenState();
}

class _SignupPasswordScreenState extends State<SignupPasswordScreen> with Loader, AppMessages{

  String password = "";

  _saveUser() async {
    var controller = widget.controller;
    log(controller.cpf);
    showLoader();
    await controller.postSignup(
      SignupModel(cpf: controller.cpf, password: password)
    )
    .whenComplete(() async {
        hideLoader();
        if(controller.signupState == AppState.success){
          Navigator.push(context, MaterialPageRoute(builder: (_) =>
          const SuccessScreen()
          ));
        }
      })
    .catchError((error, stackTrace){
      showCustomDialog(
        btnLabel: "Entendi",
        title: "Erro",
        message: error.toString(),
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: 'Senha',
        backgroundColor: Colors.white,
        secondaryColor: AppColors.darkGray,
        showBackButton: false,
      ),

      body: SafeArea(
        child: NewPasswordPage(
            onClick: _saveUser,
            isSignup: true,
            getPassword: (pass){
              password = pass;
            },
        ),
      )

    );
  }
}
