

import '/data/models/signup_model.dart';
import 'package:flutter/material.dart';
import '/data/repositories/auth_repository.dart';
import '../../constants/app_state.dart';


class AuthController extends ChangeNotifier{

  final IAuthRepository authRepository;
  AuthController(this.authRepository);

  AppState signupState = AppState.initial;

  String cpf = "";


  Future<void> postRegisterCpf(String cpf) async {
    signupState = AppState.initial;
    try{
      ///API Request
      Future.delayed(const Duration(seconds: 2));
      signupState = AppState.success;
    }catch (e){
      rethrow;
    }
  }

  Future<void> postSignup(SignupModel data) async {
    signupState = AppState.initial;
    try{
      ///API Request
      Future.delayed(const Duration(seconds: 2));
      signupState = AppState.success;
    }catch (e){
      rethrow;
    }
  }

}