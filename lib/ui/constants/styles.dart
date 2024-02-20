
import '/ui/constants/colors.dart';
import 'package:flutter/material.dart';

class AppStyles{

  static TextStyle subtitle = const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500
  );

  static TextStyle body = const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w400
  );

  static TextStyle title = const TextStyle(
      color: Colors.white,
      fontSize: 34,
      fontWeight: FontWeight.w400
  );

  static TextStyle titleBold = const TextStyle(
      color: Colors.white,
      fontSize: 34,
      fontWeight: FontWeight.w700
  );

  static TextStyle titleDark = const TextStyle(
      color: Colors.black,
      fontSize: 40,
      fontWeight: FontWeight.w600
  );

  static TextStyle subtitleBold = const TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w800
  );


  static BoxDecoration topBorderRadius =  const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24)
      )
  );

  static InputBorder validateBorderOrange = const UnderlineInputBorder(
      borderSide: BorderSide(
          color: Colors.deepOrangeAccent,
          width: 4
      )
  );

  static InputBorder validateBorderGreen = UnderlineInputBorder(
      borderSide: BorderSide(
          color: AppColors.green,
          width: 4
      )
  );

  static InputBorder validateBorderRed = UnderlineInputBorder(
      borderSide: BorderSide(
          color: AppColors.red,
          width: 4
      )
  );

  static InputBorder validateBorderBackground = UnderlineInputBorder(
      borderSide: BorderSide(
          color: AppColors.background,
          width: 4
      )
  );




}