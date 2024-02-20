
import 'dart:developer';
import '/data/models/signup_model.dart';
import '/data/repositories/auth_repository.dart';

abstract class IAuthServiceLogin{
  Future postLogin(UserCredentialsModel data);
}

class AuthServiceLogin implements IAuthServiceLogin{

  final IAuthRepository authRepository;
  AuthServiceLogin(this.authRepository);


  @override
  Future<void> postLogin(UserCredentialsModel data) async {
    try{
      log("post Login from AuthService");
      ///API Request
      await Future.delayed(const Duration(seconds: 2));
    }catch (e){
      rethrow;
    }
  }


}