
import 'package:flutter/material.dart';
import 'package:untitled/ui/constants/colors.dart';


mixin Loader<T extends StatefulWidget> on State<T>{

  var isOpen = false;

  showLoader(){
    if(!isOpen){
      isOpen = true;
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context){
            return Center(
              child: SizedBox(
                height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    color: AppColors.orange,
                    strokeWidth: 6,
                  )
              ),
            );
          }
      );
    }
  }

  void hideLoader(){
    if(isOpen){
      isOpen = false;
      Navigator.pop(context);
    }
  }


}