
import 'dart:developer';
import '../../data/models/signup_model.dart';
import '../../data/repositories/auth_repository.dart';

abstract class IAuthServiceForgot{
  Future postForgot(UserCredentialsModel data);
}

class AuthServiceForgot implements IAuthServiceForgot{

  final IAuthRepository authRepository;
  AuthServiceForgot(this.authRepository);


  @override
  Future<void> postForgot(UserCredentialsModel data) async {
    try{
      log("post Login from AuthService");
      ///API Request
      await Future.delayed(const Duration(seconds: 2));
    }catch (e){
      rethrow;
    }
  }


}