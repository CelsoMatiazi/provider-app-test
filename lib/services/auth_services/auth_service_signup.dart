
import 'dart:developer';
import '/data/models/signup_model.dart';
import '/data/repositories/auth_repository.dart';


abstract class IAuthServiceSignup{
  Future postRegisterCpf(String cpf);
  Future postRegisterPassword(SignupModel data);
}

class AuthServiceSignup implements IAuthServiceSignup{

  final IAuthRepository authRepository;
  AuthServiceSignup(this.authRepository);

  @override
  Future<void> postRegisterCpf(String cpf) async {
    try{
      log("post Cpf from AuthService");
      ///API Request
      await Future.delayed(const Duration(seconds: 2));
    }catch (e){
      rethrow;
    }
  }

  @override
  Future<void> postRegisterPassword(SignupModel data) async {
    try{
      log("post Password from AuthService");
      log(data.cpf);
      ///API Request
      await Future.delayed(const Duration(seconds: 2));
    }catch (e){
      rethrow;
    }
  }


}