import 'package:dart_exercise_5/Client.dart';

// Crie uma classe de sua preferência com, no mínimo, um atributo, um método com retorno e um método sem retorno. Depois, instancie três ou mais objetos para testar esta classe.

void main() {
  Client client1 = Client(
    name: 'Júlia',
    cpf: '999.999.999-99',
    registrationDate: '22/02/22',
  );
  var add1 = client1.addClient();

  Client client2 = Client(
    name: 'Fulana',
    cpf: '888.888.888-88',
    registrationDate: '11/01/22',
  );
  var add2 = client2.addClient();

  Client client3 = Client(
    name: 'Maria',
    cpf: '777.777.777-77',
    registrationDate: '30/02/22',
  );
  var add3 = client3.addClient();

  var list = [add1, add2, add3];
  
  print('\nRegistration:');
  for (var i = 0; i < list.length; i+=1) {
    print('\nName: ${list[i].name}\nCPF: ${list[i].cpf}\nRegistration Date: ${list[i].registrationDate}');  
  }
}
