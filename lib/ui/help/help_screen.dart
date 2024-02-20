import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/ui/components/custom_text_field.dart';
import '/ui/constants/colors.dart';
import '/ui/constants/styles.dart';
import '/ui/components/custom_app_bar.dart';
import '/ui/utils/size_extensions.dart';
import '../components/custom_button.dart';



class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: CustomAppBar(
          title: "Ajuda",
          backgroundColor: Colors.white,
          secondaryColor: AppColors.darkGray,
      ),
      
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("Como podemos te ajudar?",
              style: AppStyles.title.copyWith(
                color: AppColors.darkGray
              ),),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: CustomTextField(label: "Qual é a sua duvida?"),
          ),

          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return const HelpItemCardWidget();
                  }
              )
          ),

          SafeArea(
            child: SizedBox(
              width: context.percentWidth(.9),
              child: CustomButton(
                backgroundColor: AppColors.orange,
                label: 'Fale conosco',
                icon: const Icon(Icons.phone),
                onClick: () {  },
              ),
            ),
          ),

          const SizedBox(height: 10,)
          



        ],
      ),

    );
  }
}

class HelpItemCardWidget extends StatelessWidget {
  const HelpItemCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          collapsedShape: const ContinuousRectangleBorder(),
          shape: const ContinuousRectangleBorder(),
          tilePadding: const EdgeInsets.symmetric(horizontal: 25),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
           title: Text("Principal duvida 01",
             style: AppStyles.subtitle.copyWith(
               color: AppColors.darkGray
             ),
           ),
         children: [
           Text("Esse é o conteudo da ajuda",
             style: AppStyles.body.copyWith(
                 color: AppColors.darkGray
             ),
           ),
           const SizedBox(height: 10,),
         ],
       ),
        Divider(thickness: 2, color: AppColors.background,),
      ],
    );
  }
}
