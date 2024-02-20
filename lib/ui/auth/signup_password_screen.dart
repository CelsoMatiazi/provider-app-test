
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/ui/auth/controller/signup_password_controller.dart';
import '../../data/models/signup_model.dart';
import '../components/success_screen.dart';
import '../constants/app_state.dart';
import '/ui/components/custom_app_bar.dart';
import '/ui/constants/colors.dart';
import '/ui/auth/components/new_password_page.dart';
import '/ui/utils/app_messages.dart';
import '/ui/utils/loader.dart';

class SignupPasswordScreen extends StatefulWidget {


  const SignupPasswordScreen({
    super.key,
  });

  @override
  State<SignupPasswordScreen> createState() => _SignupPasswordScreenState();
}

class _SignupPasswordScreenState extends State<SignupPasswordScreen> with Loader, AppMessages{

  String password = "";

  _savePassword(String cpf) async {
    var controller = context.read<SignupPasswordController>();
    showLoader();
    await controller.postSignup(
      UserCredentialsModel(cpf: cpf, password: password)
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
  Widget build(BuildContext context){

    final cpf = ModalRoute.of(context)!.settings.arguments as String;

    return  Scaffold(
      appBar: CustomAppBar(
        title: 'Senha',
        backgroundColor: Colors.white,
        secondaryColor: AppColors.darkGray,
        showBackButton: false,
      ),

      body: SafeArea(
        child: NewPasswordPage(
            onClick: () =>  _savePassword(cpf),
            isSignup: true,
            getPassword: (pass){
              password = pass;
            },
        ),
      )

    );
  }
}
