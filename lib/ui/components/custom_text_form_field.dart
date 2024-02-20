import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/ui/utils/size_extensions.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class CustomTextFormField extends StatefulWidget {

  final String label;
  final Function(String val) validator;
  final Function(String val)? onChange;
  final TextEditingController? controller;
  final bool readOnly;
  final List<TextInputFormatter> inputFormatters;
  final bool obscureText;
  final InputBorder? staticBorderColor;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.validator,
    this.onChange,
    this.controller,
    this.readOnly = false,
    this.inputFormatters = const [],
    this.obscureText = false,
    this.staticBorderColor
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  bool _isValidate = false;
  bool _visibility = false;

  _changeVisibility(){
    _visibility = !_visibility;
    setState(() {});
  }

  InputBorder _getBorderColor(InputBorder color){
    if(widget.staticBorderColor != null) return widget.staticBorderColor!;
    return color;
  }

  IconData _getVisibilityIcon(){
    return _visibility
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
  }

  @override
  void initState() {
    super.initState();
    _visibility = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 30,
            width: context.screenWidth,
            decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18)
                )
            ),
          ),
        ),


        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: TextFormField(
              controller: widget.controller,
              readOnly: widget.readOnly,
              obscureText: _visibility,
              inputFormatters: widget.inputFormatters,
              decoration: InputDecoration(
                  suffixIcon: widget.obscureText ?  IconButton(
                    onPressed: _changeVisibility,
                    icon: Icon(
                      _getVisibilityIcon(),
                      size: 25,
                      color: Colors.black45,
                    ),
                  ) : null,
                  fillColor: AppColors.background,
                  filled: true,
                  isDense: true,
                  contentPadding: const EdgeInsets.only(left: 20, bottom: 20),
                  labelText: widget.label,
                  errorBorder: AppStyles.validateBorderRed,
                  enabledBorder: _isValidate
                     ? _getBorderColor(AppStyles.validateBorderGreen)
                     : _getBorderColor(AppStyles.validateBorderBackground),
                  border: _getBorderColor(AppStyles.validateBorderOrange),
                  focusedBorder: _getBorderColor(AppStyles.validateBorderOrange)
              ),
              onChanged: (value){
                if(widget.onChange != null) widget.onChange!(value);
              },
              validator: (value){
                if(widget.validator(value!) == null){
                  _isValidate = true;
                }else{
                  _isValidate = false;
                }
                return widget.validator(value);
              }
          ),
        ),
      ],
    );
  }
}
