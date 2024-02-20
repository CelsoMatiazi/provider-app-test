import 'package:flutter/material.dart';
import '/ui/components/custom_app_bar.dart';
import '../../components/custom_button.dart';
import '../../constants/colors.dart';
import '../../constants/styles.dart';
import '../../utils/app_messages.dart';
import '../../utils/regex_validate.dart';
import '../../components/custom_text_form_field.dart';

class NewPasswordPage extends StatefulWidget {

  final VoidCallback onClick;
  final Function(String val)? getPassword;
  final bool isForgotPassword;
  final bool isSignup;

  const NewPasswordPage({
    super.key,
    required this.onClick,
    this.isForgotPassword = true,
    this.isSignup = false,
    this.getPassword
  });

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> with AppMessages{

  final _formKey = GlobalKey<FormState>();

  final _passwordCtrl = TextEditingController();
  final _newPasswordCtrl = TextEditingController();
  final _confNewPasswordCtrl = TextEditingController();

  final _regex = RegexValidate();

  bool _isCharactersNumbersValid = false;
  bool _isNumbersValid = false;
  bool _isUpperValid = false;
  bool _isLowerValid = false;
  bool _isSpecialValid = false;

  _validateForms(){
    if (_formKey.currentState!.validate() && _newPasswordCtrl.text.isNotEmpty) {
      if(widget.getPassword != null) widget.getPassword!(_newPasswordCtrl.text);
      widget.onClick();
    }
  }

  String? _validateCurrentPassword(){
    if(_passwordCtrl.text.isEmpty) return "Campo obrigatorio";
    if(_passwordCtrl.text.length < 8) return "Senha não parece estar certa";
    return null;
  }

  String? _validatePassword(){
    if(_newPasswordCtrl.text.isEmpty) return "Campo obrigatorio";
    if(!_passwordRules()) return "Senha não parece estar certa";
    return null;
  }

  String? _passwordMatch(){
    if(_confNewPasswordCtrl.text.isEmpty) return "Campo obrigatorio";
    if(_newPasswordCtrl.text
        != _confNewPasswordCtrl.text) return "As senhas não se correspondem";
    return null;
  }

  bool _comparePassword(){
    if( _newPasswordCtrl.text
        == _confNewPasswordCtrl.text
        && _newPasswordCtrl.text.isNotEmpty) return true;
    return false;
  }



  bool _passwordRules(){
    _isUpperValid = _regex.capitalLetter(_newPasswordCtrl.text);
    _isSpecialValid = _regex.specialLetter(_newPasswordCtrl.text);
    _isNumbersValid = _regex.number(_newPasswordCtrl.text);
    _isCharactersNumbersValid = _newPasswordCtrl.text.length >= 8 ? true : false;
    _isLowerValid = _regex.lowerLetter(_newPasswordCtrl.text);

    if(_isUpperValid &&
        _isSpecialValid &&
        _isNumbersValid &&
        _isCharactersNumbersValid &&
        _isLowerValid) return true;

    return false;
  }


  @override
  void dispose() {
    super.dispose();
    _confNewPasswordCtrl.dispose();
    _newPasswordCtrl.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: widget.isForgotPassword
          ? null
          : CustomAppBar(
          title: "Atualizar senha",
          backgroundColor: Colors.white,
          secondaryColor: AppColors.darkGray,
      ),

      body: SafeArea(
        child: LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
        
                            if(widget.isSignup)
                              Text("Hora de criar a sua senha", style: AppStyles.title.copyWith(
                                  color: AppColors.darkGray ),
                              ),
        
                            if(!widget.isSignup)
                            Text("Atualize sua senha", style: AppStyles.title.copyWith(
                                color: AppColors.darkGray ),
                            ),
        
                            if(!widget.isSignup)
                            const SizedBox(height: 10,),
        
                            if(!widget.isSignup)
                            Text("Digite e confirme sua nova senha, seguindo as regras abaixo.",
                              style: AppStyles.body.copyWith(
                                  color: AppColors.darkGray
                              ),
                            ),
        
                            const SizedBox(height: 20,),
        
        
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
        
                                  if(!widget.isForgotPassword)
                                    CustomTextFormField(
                                        controller: _passwordCtrl,
                                        obscureText: true,
                                        label: "Senha atual",
                                        staticBorderColor: AppStyles.validateBorderBackground,
                                        validator: (_) => _validateCurrentPassword(),
                                    ),
        
                                  const SizedBox(height: 20,),
        
                                  CustomTextFormField(
                                    controller: _newPasswordCtrl,
                                    obscureText: true,
                                    label: widget.isSignup
                                        ? "Nova senha"
                                        : "Inserir senha",
                                    staticBorderColor: _passwordRules()
                                        ? AppStyles.validateBorderGreen
                                        : AppStyles.validateBorderBackground,
                                    validator: (value) => _validatePassword(),
                                    onChange: (_) => setState(() {})
                                  ),
        
                                  const SizedBox(height: 20,),
        
                                  CustomTextFormField(
                                      controller: _confNewPasswordCtrl,
                                      obscureText: true,
                                      staticBorderColor: _comparePassword()
                                          ? AppStyles.validateBorderGreen
                                          : AppStyles.validateBorderBackground,
                                      label: widget.isSignup
                                          ? "Confirmar nova senha"
                                          : "Confirmar senha",
                                      validator: (value) => _passwordMatch(),
                                      onChange: (value){
                                        if(value.length > 6){
                                          setState(() {});
                                        }
                                      },
                                  ),
                                ],
                              ),
                            ),
        
                            const SizedBox(height: 30,),
        
                            PasswordValidationLine(
                              text: "8 caracteres",
                              status: _isCharactersNumbersValid,
                            ),
                            PasswordValidationLine(
                              text: "Símbolos ( ! @ # \$ % * )",
                              status: _isSpecialValid,
                            ),
                            PasswordValidationLine(
                              text: "Letras maiúsculas (A-Z)",
                              status: _isUpperValid,
                            ),
                            PasswordValidationLine(
                              text: "Letras minúsculas (a-z)",
                              status: _isLowerValid,
                            ),
                            PasswordValidationLine(
                              text: "Números (0-9)",
                              status: _isNumbersValid,
                            ),
        
                          ],
                        ),
        
                        const SizedBox(height: 20,),
        
                        CustomButton(
                            backgroundColor: AppColors.orange,
                            label: "Atualizar",
                            onClick: _validateForms
                        ),
        
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}

class PasswordValidationLine extends StatelessWidget {

  final String text;
  final bool status;
  const PasswordValidationLine({
    super.key,
    required this.text,
    required this.status
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Icon(Icons.check_circle_outline,
              color: status ? Colors.green : Colors.black45
          ),
          const SizedBox(width: 10,),
          Text(text, style: AppStyles.body.copyWith(
              color: status ? Colors.green : Colors.black45
          ),)
        ],
      ),
    );
  }
}