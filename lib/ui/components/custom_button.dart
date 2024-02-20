

import 'package:flutter/material.dart';
import '/ui/utils/size_extensions.dart';
import '../constants/styles.dart';

class CustomButton extends StatelessWidget {

  final Color backgroundColor;
  final String label;
  final VoidCallback? onClick;
  final Widget icon;

  const CustomButton({
    super.key,
    this.backgroundColor =  const Color(0xffEC6920),
    required this.label,
    this.onClick,
    this.icon = const SizedBox.shrink()
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: 55,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 5,),
            Text(label, style: AppStyles.body,),
            const SizedBox(width: 5,),
          ],
        ),
      ),
    );
  }
}


/*
class CustomButton extends StatelessWidget {

  final Color backgroundColor;
  final String label;
  final VoidCallback onClick;
  final Widget icon;

  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.label,
    required this.onClick,
    this.icon = const SizedBox.shrink()
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: context.screenWidth,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 5,),
            Text(label,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),),
          ],
        ),

      ),
    );
  }
}

 */