

import 'package:flutter/material.dart';
import '/data/models/signup_model.dart';
import '/services/auth_services/auth_service_signup.dart';
import '../../constants/app_state.dart';


class SignupPasswordController extends ChangeNotifier{

  final IAuthServiceSignup serviceSignup;
  SignupPasswordController(this.serviceSignup);

  AppState signupState = AppState.initial;

  Future<void> postSignup(UserCredentialsModel data) async {
    signupState = AppState.initial;
    try{
      await serviceSignup.postRegisterPassword(data);
      signupState = AppState.success;
    }catch (e){
      rethrow;
    }
  }

}