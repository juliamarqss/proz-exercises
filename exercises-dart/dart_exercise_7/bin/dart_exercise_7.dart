import 'package:dart_exercise_7/Client.dart';
import 'package:dart_exercise_7/Employee.dart';

// Crie três classes, as quais devem conter um método de manipulação de String cada e que retornem um valor quando forem invocados.

void main() {
  // Clients
  Client client1 = Client(
    name: 'Júlia',
    cpf: '999.999.999-99',
    registrationDate: '22/02/22',
  );
  var add1 = client1.addClient();
  var token1 = client1.validadeToken('648931231868');

  Client client2 = Client(
    name: 'Fulana',
    cpf: '888.888.888-88',
    registrationDate: '11/01/22',
  );
  var add2 = client2.addClient();
  var token2 = client1.validadeToken('67887798798');

  Client client3 = Client(
    name: 'Maria',
    cpf: '777.777.777-77',
    registrationDate: '30/02/22',
  );
  var add3 = client3.addClient();
  var token3 = client1.validadeToken('789779789123');

  var list1 = [add1, add2, add3];

  // Employees
  Employee emp1 = Employee(
    name: 'Luiz',
    cpf: '666.666.666-66',
  );
  var addEmp1 = emp1.addEmployee();

  Employee emp2 = Employee(
    name: 'João',
    cpf: '555.555.555-55',
  );
  var addEmp2 = emp2.addEmployee();

  var list2 = [addEmp1, addEmp2];

  print('\nCustomer Registration:');
  for (var i = 0; i < list1.length; i+=1) {
    print('\nName: ${list1[i].name}\nCPF: ${list1[i].cpf}\nRegistration Date: ${list1[i].registrationDate}');  
  }
  print('\n\nEmployee Registration:');
  for (var idx = 0; idx < list2.length; idx+=1) {
    print('\nName: ${list2[idx].name}\nCPF: ${list2[idx].cpf}');  
  }
}
