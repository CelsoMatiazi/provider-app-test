
class SignupModel{

  String cpf;
  String password;

  SignupModel({
    required this.cpf,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'cpf': cpf,
      'senha': password,
    };
  }


}