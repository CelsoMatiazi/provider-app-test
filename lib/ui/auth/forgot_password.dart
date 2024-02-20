
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'components/cpf_page.dart';
import 'components/new_password_page.dart';
import 'components/security_code_page.dart';
import 'components/success_page.dart';
import '/ui/help/help_screen.dart';
import '/ui/utils/size_extensions.dart';
import '/ui/constants/colors.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final PageController _pageController = PageController();

  double _indicatorValue = 0.0;
  int _currentPage = 0;



  _setIndicatorPosition(int index){
    if(index == 0) _indicatorValue = 0.0;
    if(index == 1) _indicatorValue = 0.33;
    if(index == 2) _indicatorValue = 0.66;
    if(index == 3) _indicatorValue = 1;
    setState(() {});
  }

  _changePage(){
    _pageController.animateToPage(_currentPage + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [

            SizedBox(
              height: 70,
              width: context.screenWidth,
              child: Row(
                children: [

                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new, size: 20,)
                  ),


                  Expanded(
                      child: LinearProgressIndicator(
                        value: _indicatorValue,
                        backgroundColor: AppColors.silver,
                        color: AppColors.orange,
                      )
                  ),

                  const SizedBox(width: 15,),

                  GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const HelpScreen()
                            )
                        );
                      },
                      child: const Icon(Icons.help_center)
                  ),
                  const SizedBox(width: 15,),

                ],
              ),
            ),
            Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index){
                    _currentPage = index;
                    _setIndicatorPosition(index);
                  },
                  children: [

                    CpfPage(onClick: () => _changePage()),
                    SecurityCodePage(onClick: () => _changePage()),
                    NewPasswordPage(onClick: () => _changePage()),
                    SuccessPage(onClick: (){},)

                  ],
                )
            )

          ],
        ),
      ),

    );
  }
}










