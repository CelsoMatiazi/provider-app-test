import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import '../models/signup_model.dart';
import '../constants/http_constants.dart';
import '../../services/rest_client/http_client.dart';


abstract class IAuthRepository{
  Future postRegisterCPF({required String cpf});
  Future postSignup({required UserCredentialsModel signupData});
  Future postLogin({required UserCredentialsModel signupData});
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
  Future postSignup({required UserCredentialsModel signupData}) async {
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
  Future postLogin({required UserCredentialsModel signupData}) async {
    final Response response =  await client.post(
        url: HttpConstants.login,
        body: json.encode(signupData.toMap())
    );
    // log(response.statusCode.toString());
    // log(response.body);
    final body = jsonDecode(response.body);
    if(response.statusCode == 200) return body['access'];
    throw body['message'] ?? HttpConstants.unknownError;

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
    if(response.statusCode == 200) return body['message'];
    throw body['message'] ?? HttpConstants.unknownError;
  }



}