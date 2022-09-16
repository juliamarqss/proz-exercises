import 'dart:io';
import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:uuid/uuid.dart';
import 'package:dart_exercise_8/empresa.dart';
import 'package:dart_exercise_8/endereco.dart';
import 'package:dart_exercise_8/pessoa_fisica.dart';
import 'package:dart_exercise_8/pessoa_juridica.dart';

var lista = [];

final uuid = Uuid();
final geradorID = uuid.v1();
final hora = DateTime.now();

void main() {

  // print(empresa2.endereco.bairro);
  // lista.add(empresa2);
  // print(lista[0].endereco.numero);

  var screen = '';
  do {
    print('\n1) Cadastrar uma nova empresa; \n2) Buscar empresa cadastrada por CNPJ; \n3) Buscar empresa por CPF do sócio; \n4) Listar empresas cadastradas em ordem alfabética (baseado na Razão Social); \n5) Excluir uma empresa (por ID); \n0) Sair.\n');

    screen = stdin.readLineSync()!;

    switch (screen) {
      case '1':
      cadastrarEmpresa();
      break;
      case '2':
      // buscarCNPJ();
      break;
      case '3':
      // buscarCPF();
      break;
      case '4':
      listar(lista);
      break;
      case '5':
      // excluir();
      break;
      case '0':
      print('\nObrigado por usar nosso app, volte sempre!');
      break;
      default:
      print("Opção digitada é inválida, tente novamente!");
      break;
    }
  } while (screen != "0");
}

void cadastrarEmpresa() {
  registrarEmpresa();
  print('\n${lista[0].endereco}.');
}

void registrarEmpresa() {

  print('\nEscreva a Razão Social:');
  final rS = stdin.readLineSync()!;

  print('\nEscreva o Nome Fantasia:');
  final nF = stdin.readLineSync()!;

  print('\nEscreva o CNPJ:');
  final cnpj = stdin.readLineSync()!;
  if (!CNPJValidator.isValid(cnpj)){
    print('Digite novamente!');
  } else {
    final cnpjFormat = '${cnpj.substring(0,2)}.${cnpj.substring(2,5)}.${cnpj.substring(5,8)}/${cnpj.substring(8,12)}-${cnpj.substring(12,14)}';

    final enderecoEmp = endereco();
    
    final foneEmp = telefone();
    
    print('\nO tipo do sócio é: \n1) Pessoa Jurídica; \n2) Pessoa Física.\n');
    final screen = stdin.readLineSync()!;

    if (screen == '1') {
      Empresa emp1 = Empresa(
        cnpj: cnpjFormat,
        horarioDoCadastro: '$hora',  
        endereco: enderecoEmp,
        id: geradorID,
        razaoSocial: rS,
        nomeFantasia: nF,
        pj: registrarPJ(),
        telefone: foneEmp,
      );
      lista.add(emp1);
    }

    if (screen == '2'){
      Empresa emp2 = Empresa(
        cnpj: cnpjFormat,
        horarioDoCadastro: '$hora',  
        endereco: enderecoEmp,
        id: geradorID,
        razaoSocial: rS,
        nomeFantasia: nF,
        pf: registrarPF(),
        telefone: foneEmp,
      );
      lista.add(emp2);
    }
  }
}

Map? registrarPJ() {
  print('\nPreencher os dados do Sócio PJ ↓');
  print('\nEscreva a Razão Social:');
  final rS = stdin.readLineSync()!;

  print('\nEscreva o Nome Fantasia:');
  final nF = stdin.readLineSync()!;

  print('\nEscreva o CNPJ:');
  final cnpj = stdin.readLineSync()!;
  if (!CNPJValidator.isValid(cnpj)){
    return {'Erro':'Digite novamente!'};
  } else {
    if (nF.isEmpty){
      PessoaJuridica pj1 = PessoaJuridica(
        endereco: endereco(),
        cnpj: cnpj,
        razaoSocial: rS,
        nomeFantasia: nF,
      );
      pj1;
    } else {
      PessoaJuridica pj2 = PessoaJuridica(
        endereco: endereco(),
        cnpj: cnpj,
        razaoSocial: rS,
      );
      pj2;
    }
  }
}

Map? registrarPF() {
  print('\nPreencher os dados do Sócio PF ↓');
  print('\nEscreva o Nome:');
  final nome = stdin.readLineSync()!;

  print('\nEscreva o CPF:');
  final cpf = stdin.readLineSync()!;
  if (!CPFValidator.isValid(cpf)){
    return {'Erro':'Digite novamente!'};
  } else {
    PessoaFisica pf1 = PessoaFisica(
      nome: nome,
      cpf: cpf,
      endereco: endereco(),
    );
    pf1;
  }
}

String endereco() {
  print('\nPreencher os dados do endereço ↓');
  print('Logradouro:');
  final rua = stdin.readLineSync()!;

  print('\nNúmero:');
  final numero = stdin.readLineSync()!;

  print('\nComplemento:');
  final complemento = stdin.readLineSync()!;

  print('\nBairro:');
  final bairro = stdin.readLineSync()!;

  print('\nCidade:');
  final cidade = stdin.readLineSync()!;
  
  print('\nEstado:');
  final estado = stdin.readLineSync()!;
  final estHigh = estado.toUpperCase();

  print('\nCEP:');
  final cep = stdin.readLineSync()!;
  final cepFormat = '${cep.substring(0,5)}-${cep.substring(5,8)}';

  Endereco end1 = Endereco(
    bairro: bairro,
    cep: cepFormat,
    estado: estHigh,
    logradouro: rua,
    numero: numero,
    complemento: complemento,
    cidade: cidade,
  );

  var formato = '${end1.logradouro}, ${end1.numero}, ${end1.complemento}, ${end1.bairro}, ${end1.cidade}/${end1.estado}, ${end1.cep}';

  var formato2 = '${end1.logradouro}, ${end1.numero}, ${end1.bairro}, ${end1.cidade}/${end1.estado}, ${end1.cep}';

  if (complemento.isEmpty){
    return formato2;
  } else {
    return formato;
  }
}

String? telefone() {
  print('\nEscreva o Telefone:');
  final fone = stdin.readLineSync()!;

  if(fone.length > 9) {
    // print('aqui');
    String texto = 'Digite novamente!';
    print(texto);
    return null;
  } else {
    // print('AQUII');
    final foneFormat = '${fone.substring(0,5)}-${fone.substring(5,9)}';
    return foneFormat;
  }  
}

listar(emp) {
  if (emp.isEmpty) {
    print('A lista está vázia');
  } else {
    print('\nLista de Empresas Cadastradas:\n');
    if(emp.contains('CPF')){
      for (var i; i < lista.length; i+=1) {
        print('ID: ${emp[i]['ID']} \nCNPJ: ${emp[i]['CNPJ']} \n Data de Cadastro: ${emp[i]['Data de Cadastro']} \nRazão Social: ${emp[i]['Razão Social']} \nNome Fantasia: ${emp[i]['Nome Fantasia']} \nTelefone: ${emp[i]['Telefone']} \nEndereço: ${emp[i]['Telefone']} \nSócio: \n CPF: ${emp[i]['CPF']} \nNome Completo: ${emp[i]['Nome Completo']} \nEndereço: ${emp[i]['Endereço']}');
      }
    } else {
      for (var idx; idx < lista.length; idx+=1) {
        print('ID: ${emp[idx]['ID']} \nCNPJ: ${emp[idx]['CNPJ']} \n Data de Cadastro: ${emp[idx]['Data de Cadastro']} \nRazão Social: ${emp[idx]['Razão Social']} \nNome Fantasia: ${emp[idx]['Nome Fantasia']} \nTelefone: ${emp[idx]['Telefone']} \nEndereço: ${emp[idx]['Endereço']} \nSócio: \n CNPJ: ${emp[idx]['CPNJ']} \nRazão Social: ${emp[idx]['Razão Social']} \nNome Fantasia: ${emp[idx]['Nome Fantasia']} \nEndereço: ${emp[idx]['Endereço']}');
      }
    }
  }
}

// excluir() {};
