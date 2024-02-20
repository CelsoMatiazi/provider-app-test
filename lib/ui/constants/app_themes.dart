

import 'package:flutter/material.dart';


class AppTheme{

  AppTheme._();

  static const _defaultInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
  );

  static final theme = ThemeData(
      // colorScheme: ColorScheme.fromSeed(seedColor: AppColors.orange),
      // primaryColor: Colors.orange,
      useMaterial3: true,
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Colors.transparent,
        filled: true,
        contentPadding: EdgeInsets.all(15),
        border: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        focusedBorder: _defaultInputBorder
      )

  );

}