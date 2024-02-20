import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '/ui/components/custom_text_form_field.dart';
import '/ui/utils/app_messages.dart';
import '../../components/custom_button.dart';
import '../../utils/regex_validate.dart';
import '../../constants/colors.dart';
import '../../constants/styles.dart';


class CpfPage extends StatefulWidget {

  final VoidCallback onClick;

  const CpfPage({
    super.key,
    required this.onClick
  });

  @override
  State<CpfPage> createState() => _CpfPageState();
}

class _CpfPageState extends State<CpfPage> with AppMessages {


  final _cpfMask = MaskTextInputFormatter(mask: '###.###.###-##',);
  final _formKey = GlobalKey<FormState>();
  final _validator =  RegexValidate();

  String? _validateCpf(value){
    if(value.isEmpty) return "Campo obrigatorio";
    if(!_validator.cpf(value)) return "CPF inserido não parece estar certo";
    return null;
  }

  void _validateForm(){
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) widget.onClick();
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 20,),

          Text("Insira seu CPF", style: AppStyles.title.copyWith(
              color: AppColors.darkGray
          ),),

          const SizedBox(height: 20,),

          Form(
            key: _formKey,
              child: CustomTextFormField(
                  label: "CPF",
                  inputFormatters: [_cpfMask],
                  validator: (value) => _validateCpf(value)
              )
          ),



          const Spacer(),

          CustomButton(
              backgroundColor: AppColors.orange,
              label: "Avançar",
              onClick: _validateForm
          )

        ],
      ),
    );
  }
}