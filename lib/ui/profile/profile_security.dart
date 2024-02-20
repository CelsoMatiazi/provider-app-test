import 'package:flutter/material.dart';

import '/ui/auth/components/new_password_page.dart';
import '/ui/auth/components/success_page.dart';
import '/ui/constants/styles.dart';
import '/ui/utils/size_extensions.dart';
import '../components/custom_app_bar.dart';
import '../constants/colors.dart';

class ProfileSecurity extends StatelessWidget {
  const ProfileSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: CustomAppBar(
        title: "Segurança",
        backgroundColor: Colors.white,
        secondaryColor: AppColors.darkGray,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => NewPasswordPage(
                        isForgotPassword: false,
                        onClick: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => SuccessPage(
                                  isForgotPassword: false,
                                  onClick: (){}
                              ))
                          );
                        }
                    ))
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 90,
                width: context.screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: AppColors.salman
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text("Atualizar senha",
                      style: AppStyles.subtitle.copyWith(
                        color: AppColors.darkGray
                      ),
                    ),

                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.navigate_next)
                    )

                  ],
                ),
              ),
            ),


            const SizedBox(height: 20,),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 90,
              width: context.screenWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: AppColors.salman
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Face ID",
                        style: AppStyles.subtitle.copyWith(
                            color: AppColors.darkGray
                        ),
                      ),

                      Text("Autenticação por Face ID",
                        style: AppStyles.body.copyWith(
                            color: AppColors.darkGray
                        ),
                      ),
                    ],
                  ),

                  Switch(
                      value: true,
                      activeColor: Colors.white,
                      activeTrackColor: AppColors.orange,
                      inactiveTrackColor: Colors.white,
                      inactiveThumbColor: Colors.black54,
                      onChanged: (value){}
                  )

                ],
              ),
            )


          ],
        ),
      ),

    );
  }
}
