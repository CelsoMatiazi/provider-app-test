

import 'package:cpf_cnpj_validator/cpf_validator.dart';

class RegexValidate{

  bool email(String value){
    String  pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool capitalLetter(String value){
    String  pattern = r'[A-Z]';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool lowerLetter(String value){
    String  pattern = r'[a-z]';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool specialLetter(String value){
    String  pattern = r'[`!@#$%^&*()_+\-=\[\]{};"|,.<>?~]';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool number(String value){
    String  pattern = r'[0-9]';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool cpf(String value){
    return CPFValidator.isValid(value);
  }

}