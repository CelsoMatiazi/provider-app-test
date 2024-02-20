import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/ui/utils/size_extensions.dart';
import '../constants/colors.dart';

class CustomTextField extends StatelessWidget {

  final String label;
  final TextEditingController? controller;
  final bool readOnly;
  final List<TextInputFormatter> inputFormatters;

  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.readOnly = false,
    this.inputFormatters = const []
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 70,
      width: context.screenWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.background
      ),
      child: TextField(
        controller: controller,
        inputFormatters: inputFormatters,
        readOnly: readOnly,
        style: TextStyle(
            color: readOnly ? Colors.black45 : Colors.black
        ),
        decoration: InputDecoration(
            labelText: label,
        ),
      ),
    );
  }
}