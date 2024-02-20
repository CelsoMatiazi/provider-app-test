

import 'package:flutter/material.dart';
import 'package:untitled/services/auth_services/auth_service_signup.dart';
import '/data/repositories/auth_repository.dart';
import '../../constants/app_state.dart';


class SignupCpfController extends ChangeNotifier{

  final IAuthServiceSignup serviceSignup;
  SignupCpfController(this.serviceSignup);

  AppState signupState = AppState.initial;

  Future<void> postRegisterCpf(String cpf) async {
    signupState = AppState.initial;
    try{
      await serviceSignup.postRegisterCpf(cpf);
      signupState = AppState.success;
    }catch (e){
      rethrow;
    }
  }

}