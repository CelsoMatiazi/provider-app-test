import 'package:another_flushbar/flushbar.dart';
import '/ui/components/custom_button.dart';
import '/ui/constants/colors.dart';
import '/ui/constants/styles.dart';
import 'package:flutter/material.dart';


mixin AppMessages<T extends StatefulWidget> on State<T>{

  void flushMessage({
    required String message,
    Color? color = Colors.red,
    Widget? icon
  }){
    Flushbar(
      icon: icon,
      message: message ,
      duration: const Duration(seconds: 3),
      backgroundColor: color!,
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(15),
      borderRadius: BorderRadius.circular(8),
    ).show(context);
  }

  Future<void> showCustomDialog({
    required title,
    required String message,
    bool isError = true,
    VoidCallback? onClick,
    bool dismissible = false,
    String btnLabel = "OK",
    bool secondBtn = false
  })  {
    return showDialog(
      barrierDismissible: dismissible,
      context: context,
      builder: (ctx) => Center(
        child: Container(
          padding: const EdgeInsets.all(15),
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(5,5),
                blurRadius: 8
              )
            ]
          ),
          child: SingleChildScrollView(
            child: Material(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text(title,
                    textAlign: TextAlign.center,
                    style: AppStyles.body.copyWith(
                      color: AppColors.orange
                    )
                  ),
                  const SizedBox(height: 10,),

                  Text(message,
                    textAlign: TextAlign.center,
                    style: AppStyles.body.copyWith(
                      color: AppColors.darkGray,
                      fontSize: 16
                    )
                  ),

                  const SizedBox(height: 20,),

                  Row(
                    children: [
                      if(secondBtn)
                      Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white
                              ),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: const Text("Não",
                                style: TextStyle(color: Colors.black),)
                          ),
                      ),

                      const SizedBox(width: 10,),

                      Expanded(
                        child: SizedBox(
                          height: 45,
                          child: CustomButton(
                              onClick: (){
                                if(onClick == null){
                                  Navigator.pop(context);
                                }else{
                                  onClick();
                                }
                              },
                              label: btnLabel,
                          ),
                        ),
                      )

                    ],
                  ),



                ],
              ),
            ),
          ),
        ),
      )
    );
  }

}