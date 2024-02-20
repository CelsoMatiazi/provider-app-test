import 'package:flutter/material.dart';
import 'package:untitled/ui/components/custom_button.dart';
import 'package:untitled/ui/constants/colors.dart';
import 'package:untitled/ui/constants/styles.dart';
import 'package:untitled/ui/utils/size_extensions.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.darkGray,

      bottomSheet: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 80,
          child: Row(
            children: [

              Expanded(child: CustomButton(
                onClick: (){
                  Navigator.pushNamed(context, "/login");
                },
                label: 'Entrar',)
              ),

              const SizedBox(width: 20,),

              Expanded(child: CustomButton(
                onClick: (){
                  Navigator.pushNamed(context, "/signup");
                },
                label: 'Cadastrar',)
              )
            ],
          ),
        ),
      ),

      body: SizedBox(
        width: context.screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Icon(Icons.account_balance_outlined,
              size: 250,
              color: AppColors.orange,
            ),
            Text("Authentication", style: AppStyles.body,)


          ],
        ),
      ),
    );
  }
}
