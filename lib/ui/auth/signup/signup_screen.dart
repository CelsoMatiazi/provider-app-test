

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import '/ui/auth/controller/auth_controller.dart';
import '/ui/auth/signup/password_screen.dart';
import '/ui/components/custom_app_bar.dart';
import '/ui/constants/colors.dart';
import '/ui/utils/loader.dart';
import '/ui/utils/app_messages.dart';
import '../../components/custom_text_form_field.dart';
import '../../components/custom_button.dart';
import '../../constants/styles.dart';
import '../../utils/regex_validate.dart';



class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with AppMessages, Loader {


  final _formKey = GlobalKey<FormState>();
  final cpfMask = MaskTextInputFormatter(mask: '###.###.###-##',);
  final _validator =  RegexValidate();

  String? _validateCpf(value){
    if(value.isEmpty) return "Campo obrigatorio";
    if(!_validator.cpf(value)) return "CPF inserido não parece estar certo";
    return null;
  }

  _validate(BuildContext contextB){
    var controller = context.read<AuthController>();
    controller.cpf = cpfMask.getUnmaskedText();
    if(_formKey.currentState!.validate()){
      Navigator.push(context, MaterialPageRoute(builder: (_) =>
        SignupPasswordScreen(controller: context.read<AuthController>(),)
      ));
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: CustomAppBar(
          title: "Cadastro",
          backgroundColor: Colors.white,
          secondaryColor: AppColors.darkGray,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),

            Text("Qual é o seu CPF?", style: AppStyles.title.copyWith(
                color: AppColors.darkGray
            ),),

            const SizedBox(height: 20,),
            Form(
              key: _formKey,
              child: CustomTextFormField(
                label: "CPF",
                inputFormatters: [cpfMask],
                validator: (value) => _validateCpf(value),
              ),
            ),

            const Spacer(),

            CustomButton(
                backgroundColor: AppColors.orange,
                label: "Avançar",
                onClick: () => _validate(context)
            ),

            const SizedBox(height: 20,),

          ],
        ),
      ),

    );
  }
}
