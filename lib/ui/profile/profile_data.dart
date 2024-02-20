import '../components/custom_button.dart';
import '/ui/components/custom_app_bar.dart';
import '/ui/components/custom_text_field.dart';
import '/ui/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfileData extends StatefulWidget {
  const ProfileData({super.key});

  @override
  State<ProfileData> createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {

  final _nameCtrl = TextEditingController();
  final _birthDateCtrl = TextEditingController();
  final _identificationCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();


  @override
  void initState() {
    super.initState();
    _nameCtrl.text = "Fulano dos Santos";
    _birthDateCtrl.text = "25/01/1978";
    _identificationCtrl.text = "123.123.123-09";
    _phoneCtrl.text = "1199999-9999";
    _emailCtrl.text = "fulano@gmail.com";
  }

  @override
  void dispose() {
    super.dispose();
    _nameCtrl.dispose();
    _birthDateCtrl.dispose();
    _identificationCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: CustomAppBar(
          title: "Meus dados",
          backgroundColor: Colors.white,
          secondaryColor: AppColors.darkGray,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      children: [

                        CustomTextField(
                            readOnly: true,
                            controller: _nameCtrl,
                            label: "Nome completo"
                        ),

                        const SizedBox(height: 20,),

                        CustomTextField(
                            readOnly: true,
                            controller: _birthDateCtrl,
                            label: "Data de nascimento"
                        ),

                        const SizedBox(height: 20,),

                        CustomTextField(
                            readOnly: true,
                            controller: _identificationCtrl,
                            label: "CPF"
                        ),

                        const SizedBox(height: 20,),

                        CustomTextField(
                            controller: _phoneCtrl,
                            label: "Celular"
                        ),

                        const SizedBox(height: 20,),

                        CustomTextField(
                            controller: _emailCtrl,
                            label: "E-mail"
                        ),
                      ],
                    ),

                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 20),
                     child: CustomButton(
                         backgroundColor: AppColors.orange,
                         label: "Atualizar",
                         onClick: (){}
                     ),
                   ),








                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
