abstract class Registry {
  String name;
  String cpf;
  String? token;

  Registry({
    required this.name,
    required this.cpf,
    this.token,
  });

  void validadeToken(token) {
    if(token.isNotEmpty) {
      this.token = token;
      // print(token);
    }
    if(token.isEmpty) {
      print('Empty!');
    }
  }
}