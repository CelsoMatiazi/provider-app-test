
class UserCredentialsModel{

  String cpf;
  String password;

  UserCredentialsModel({
    required this.cpf,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'cpf': cpf,
      'password': password,
    };
  }


}