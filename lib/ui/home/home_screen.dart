

import 'package:flutter/material.dart';
import 'package:untitled/ui/components/custom_app_bar.dart';
import '/ui/utils/size_extensions.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const CustomAppBar(
        title: "Home",
      ),

      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [


          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.only(bottom: context.percentHeight(.14)),
            child: SizedBox(
              height: context.screenHeight,
              width: context.screenWidth,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("Home Screen")


                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}




















