import 'package:flutter/material.dart';

import '../../components/custom_button.dart';
import '../../constants/colors.dart';
import '../../constants/styles.dart';

class SuccessPage extends StatelessWidget {

  final VoidCallback onClick;
  final bool isForgotPassword;

  const SuccessPage({
    super.key,
    required this.onClick,
    this.isForgotPassword = true
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Icon(Icons.lock, size: 300,),
                    const SizedBox(height: 20,),
                    Text("Senha atualizada com sucesso",
                      style: AppStyles.title.copyWith(color: AppColors.darkGray),
                    )
                  ],
                )),

            CustomButton(
                backgroundColor: AppColors.orange,
                label: isForgotPassword ? "Entrar" : "OK",
                onClick: onClick
            ),
            const SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}