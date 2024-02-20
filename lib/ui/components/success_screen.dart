import 'package:flutter/material.dart';
import '/ui/constants/colors.dart';
import '/ui/constants/styles.dart';
import 'custom_button.dart';


class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Spacer(),
            Icon(Icons.emoji_emotions,
             size: 250,
             color: AppColors.orange,
           ),

            const SizedBox(height: 20,),
            Text("Sucesso! Seu cadastro está pronto",
              style: AppStyles.title.copyWith(color:AppColors.darkGray),
            ),


            const Spacer(),

            CustomButton(
                backgroundColor: AppColors.orange,
                label: "Finalizar",
                onClick: (){
                  Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
                }
            ),

            const SizedBox(height: 20,),

          ],
        ),
      ),


    );
  }
}
