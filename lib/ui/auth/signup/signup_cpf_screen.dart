

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import '/ui/auth/controller/signup_cpf_controller.dart';
import '/ui/components/custom_app_bar.dart';
import '/ui/constants/colors.dart';
import '/ui/utils/loader.dart';
import '/ui/utils/app_messages.dart';
import '../../constants/app_state.dart';
import '../../components/custom_text_form_field.dart';
import '../../components/custom_button.dart';
import '../../constants/styles.dart';
import '../../utils/regex_validate.dart';



class SignupCpfScreen extends StatefulWidget {
  const SignupCpfScreen({super.key});

  @override
  State<SignupCpfScreen> createState() => _SignupCpfScreenState();
}

class _SignupCpfScreenState extends State<SignupCpfScreen> with AppMessages, Loader {


  final _formKey = GlobalKey<FormState>();
  final cpfMask = MaskTextInputFormatter(mask: '###.###.###-##',);
  final _validator =  RegexValidate();

  String? _validateCpf(value){
    if(value.isEmpty) return "Campo obrigatorio";
    if(!_validator.cpf(value)) return "CPF inserido não parece estar certo";
    return null;
  }

  _validate(){
    if(_formKey.currentState!.validate()) _saveCpf();
  }

  _saveCpf() async {
    showLoader();
    var controller = context.read<SignupCpfController>();
    await controller.postRegisterCpf(cpfMask.getUnmaskedText())
        .whenComplete((){
            hideLoader();
            if(controller.signupState == AppState.success){
                Navigator.pushNamed(context, "/signupPassword", arguments: cpfMask.getUnmaskedText() );
            }
        })
        .onError((error, stackTrace){
            showCustomDialog(
              btnLabel: "Entendi",
              title: "Erro",
              message: error.toString(),
            );
        });
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
                onClick: () => _validate()
            ),

            const SizedBox(height: 20,),

          ],
        ),
      ),

    );
  }
}
