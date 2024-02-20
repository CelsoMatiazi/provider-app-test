import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import '/services/http/http_client.dart';
import '../models/signup_model.dart';
import '../constants/http_constants.dart';


abstract class IAuthRepository{
  Future postRegisterCPF({required String cpf});
  Future postSignup({required SignupModel signupData});
  Future postLogin({required String email, required String password});
  Future postForgotPassword({required String email});
}

class AuthRepository implements IAuthRepository{
  final IHttpClient client;
  AuthRepository({required this.client});

  @override
  Future postRegisterCPF({required String cpf}) async {
    final Response response =  await client.post(
        url: HttpConstants.login,
        body: json.encode({"cpf" : cpf})
    );
    log(response.statusCode.toString());
    log(response.body);
    final body = jsonDecode(response.body);
    if(response.statusCode == 200) return body['token'];
    throw body["message"] ?? HttpConstants.unknownError;
  }

  @override
  Future postSignup({required SignupModel signupData}) async {
    final Response response =  await client.post(
        url: HttpConstants.signup,
        body: json.encode(signupData.toMap())
    );
    // log(response.statusCode.toString());
    // log(response.body);
    final body = jsonDecode(response.body);
    if(response.statusCode == 201) return body['message'];
    throw body["message"] ?? HttpConstants.unknownError;
  }

  @override
  Future postLogin({required String email, required String password}) async {
    final Response response =  await client.post(
        url: HttpConstants.login,
        body: json.encode({ "email" : email, "password" : password })
    );
    // log(response.statusCode.toString());
    // log(response.body);
    final body = jsonDecode(response.body);
    if(response.statusCode == 200) return body['access'];
    throw body['detail'] ?? HttpConstants.unknownError;

  }

  @override
  Future postForgotPassword({required String email}) async {
    final Response response =  await client.post(
        url: HttpConstants.login,
        body: json.encode({ "email" : email})
    );
    log(response.statusCode.toString());
    log(response.body);
    final body = jsonDecode(response.body);
    if(response.statusCode == 200) return body['detail'];
    throw body['detail'] ?? HttpConstants.unknownError;
  }



}