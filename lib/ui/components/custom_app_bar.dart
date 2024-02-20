import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  final String title;
  final Color? backgroundColor;
  final Color? secondaryColor;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor,
    this.secondaryColor,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.darkGray,
      elevation: 0,
      title: Text(title, style: AppStyles.subtitle.copyWith(
        color: secondaryColor ?? Colors.white)
      ),
      centerTitle: true,
      automaticallyImplyLeading: showBackButton,
      iconTheme: IconThemeData(
          color: secondaryColor ?? Colors.white,
          size: 18
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
