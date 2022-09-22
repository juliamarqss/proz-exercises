import 'dart:io';

import 'package:dart_exercise_8/funcoes.dart';

void main() {
  var screen = '';

  final Funcoes funcao = Funcoes();
  
  do {
    print('\n1) Cadastrar uma nova empresa; \n2) Buscar empresa cadastrada por CNPJ; \n3) Buscar empresa por CPF do sócio; \n4) Listar empresas cadastradas em ordem alfabética (baseado na Razão Social); \n5) Excluir uma empresa (por ID); \n0) Sair.\n');

    screen = stdin.readLineSync()!;

    switch (screen) {
      case '1':
      funcao.cadastrarEmpresa();
      break;
      case '2':
      funcao.buscarCNPJ();
      break;
      case '3':
      funcao.buscarCPF();
      break;
      case '4':
      funcao.listar();
      break;
      case '5':
      print('Digite o ID a empresa a ser removida da lista:');
      var rmv = stdin.readLineSync()!;
      int idx = int.parse(rmv);
      funcao.excluir(rmv, idx);
      break;
      case '0':
      print('\nObrigado por usar nosso app, volte sempre!');
      break;
      default:
      print("\nOpção digitada é inválida, tente novamente!");
      break;
    }
  } while (screen != "0");
}
