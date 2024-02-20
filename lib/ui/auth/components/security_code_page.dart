import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '/ui/utils/app_messages.dart';
import '../../constants/colors.dart';

import '../../constants/styles.dart';
import '../../components/custom_button.dart';

class SecurityCodePage extends StatefulWidget {

  final VoidCallback onClick;

  const SecurityCodePage({
    super.key,
    required this.onClick
  });

  @override
  State<SecurityCodePage> createState() => _SecurityCodePageState();
}

class _SecurityCodePageState extends State<SecurityCodePage> with AppMessages{

  CountdownController countdownController = CountdownController(autoStart: true);
  String currentCode = "";
  bool resendCode = false;

  _validate(){
    if(currentCode.length == 6){
      widget.onClick();
    }else{
      flushMessage(
          message: "Dígite o código",
          icon: const Icon(Icons.priority_high_outlined,
            color: Colors.white,
          )
      );
    }
  }





  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [

          Text("Confirme aqui com o código que te enviamos por e-mail",
            style: AppStyles.title.copyWith(color: AppColors.darkGray),
          ),


          const SizedBox(height: 20,),
          PinCodeFields(
            length: 6,
            fieldBorderStyle: FieldBorderStyle.square,
            fieldHeight: 60,
            responsive: true,
            activeBorderColor: AppColors.orange,
            borderRadius: BorderRadius.circular(12.0),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            autoHideKeyboard: true,
            fieldBackgroundColor: Colors.black12,
            borderColor: Colors.black12,
            onChange: (value){ currentCode = value; },
            onComplete: (String value) {  },
          ),

          const SizedBox(height: 20,),


          Visibility(
            visible: !resendCode,
            child: Row(
              children: [
                const Icon(Icons.info, size: 50,),
                const SizedBox(width: 10,),
                Countdown(
                  controller: countdownController,
                  seconds: 59,
                  build: (BuildContext context, double time) =>
                      Expanded(
                        child: Text("Não recebeu? Você pode pedir um novo envio em 0:${time.toString().replaceAll(".0", "").padLeft(2,"0")} ",
                          style: AppStyles.body.copyWith(color: AppColors.darkGray),
                        ),
                      ),
                  onFinished: () {
                    print('Timer is done!');
                    resendCode = true;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: (){
              resendCode = false;
              countdownController.start();
              setState(() {});
            },


            child: Visibility(
              visible: resendCode,
              child: Row(
                children: [
                  Icon(Icons.email_outlined,
                    color: AppColors.orange,
                    size: 30,
                  ),
                  const SizedBox(width: 10,),
                  Text("Enviar código novamente",
                    style: AppStyles.body.copyWith(
                        color: AppColors.orange
                    ),
                  )

                ],
              ),
            ),
          ),



          const Spacer(),

          CustomButton(
              backgroundColor: AppColors.orange,
              label: "Avançar",
              onClick: _validate
          )


        ],
      ),
    );
  }
}
