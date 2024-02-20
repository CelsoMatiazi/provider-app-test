import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/ui/auth/forgot_password.dart';
import '/ui/home/home_screen.dart';
import '/ui/utils/app_messages.dart';
import '/ui/components/custom_text_form_field.dart';
import '/ui/constants/colors.dart';

import '/ui/constants/styles.dart';
import '/ui/components/custom_app_bar.dart';
import '../components/custom_button.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with AppMessages{

  final _formKey = GlobalKey<FormState>();

  String? _validateCpf(value){
    if(value.isEmpty) return "Campo obrigatorio!";
    return null;
  }

  String? _validatePassword(value){
    if(value.isEmpty) return "Campo obrigatorio!";
    return null;
  }

  void _validateForms(){
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const HomeScreen())
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGray,

      appBar: const CustomAppBar(title: ""),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("Boas vindas!", style: AppStyles.title,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Insira seus dados e acesse o app", style: AppStyles.body,),
          ),

          const SizedBox(height: 40,),

          Expanded(
              child: LayoutBuilder(
                builder: (context, constraint) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraint.maxHeight),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: AppStyles.topBorderRadius,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Column(

                              children: [
                                const SizedBox(height: 20,),

                                Form(
                                  key: _formKey,
                                    child: Column(
                                      children: [

                                        CustomTextFormField(
                                            label: "CPF",
                                            validator: (value) => _validateCpf(value)
                                        ),

                                        const SizedBox(height: 20,),

                                        CustomTextFormField(
                                            label: "Senha",
                                            validator: (value) => _validatePassword(value)
                                        ),


                                      ],
                                    )
                                ),


                              ],
                            ),

                            Column(
                              children: [
                                const SizedBox(height: 20,),
                                CustomButton(
                                    backgroundColor: AppColors.orange,
                                    label: "Acessar",
                                    onClick: _validateForms
                                ),

                                const SizedBox(height: 20,),

                                TextButton(
                                    onPressed: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) => const ForgotPasswordScreen())
                                      );
                                    },
                                    child: const Text("Esqueci a senha")
                                ),

                                const SizedBox(height: 20,),
                              ],
                            )

                          ],
                        ),
                      ),
                    ),
                  );
                }
              )
          ),
        ],
      ),
    );
  }
}


