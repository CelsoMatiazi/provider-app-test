
import 'package:flutter/material.dart';


mixin Loader<T extends StatefulWidget> on State<T>{

  var isOpen = false;

  showLoader(){
    if(!isOpen){
      isOpen = true;
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context){
            return const Center(
              child: SizedBox(
                height: 80,
                  width: 80,
                  child: CircularProgressIndicator()
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