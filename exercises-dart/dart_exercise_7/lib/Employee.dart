import 'Registry.dart';

class Employee extends Registry {

  Employee({
    required super.name,
    required super.cpf,
  });

   Employee addEmployee() {
    return Employee(name: name, cpf: cpf);
  }

}