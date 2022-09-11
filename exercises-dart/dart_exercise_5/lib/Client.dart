import 'Registry.dart';

class Client extends Registry {
  String? registrationDate;
  
  Client({
    required super.name,
    required super.cpf,
    required this.registrationDate,
  });

  Client addClient() {
    return Client(name: name, cpf: cpf, registrationDate: registrationDate);
  }

  @override
  void rmvClient() {}
}