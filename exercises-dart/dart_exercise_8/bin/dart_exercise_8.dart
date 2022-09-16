import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:dart_exercise_8/Empresa.dart';
import 'package:dart_exercise_8/Endereco.dart';
import 'package:dart_exercise_8/PessoaFisica.dart';
import 'package:dart_exercise_8/PessoaJuridica.dart';

var listaPF = [];
var listaPJ = [];

final uuid = Uuid();

void main() {

  Endereco endereco1 = Endereco(
    logradouro: 'Sete de Setembro',
    numero: '322',
    bairro: 'Bela Vista',
    estado: 'Estado',
    cep: '484646',
  );

  Endereco endereco2 = Endereco(
    logradouro: 'Sete de Setembro',
    numero: '322',
    bairro: 'Bela Vista',
    estado: 'Estado',
    cep: '484646',
  );

  // Endereco endereco3 = Endereco(
  //   logradouro: 'Sete de Setembro',
  //   numero: '322',
  //   bairro: 'Bela Vista',
  //   estado: 'Estado',
  //   cep: '484646',
  // );

  PessoaFisica socio1 = PessoaFisica(
    nome:'',
    cpf: '',
    endereco: endereco1,
  ); 

  PessoaJuridica socio2 = PessoaJuridica(
    endereco: endereco2,
    cnpj: 'cnpj',
    razaoSocial: 'razaoSocial',
    nomeFantasia: 'dsadas',
  );

  Empresa empresa1 = Empresa(
    id: '',
    socio: socio1,
    horarioDoCadastro: '',
    telefone: '',
  );

  Empresa empresa2 = Empresa(
    id: '',
    socio: socio2,
    horarioDoCadastro: '',
    telefone: '',
  );
 
  print('\n1) Cadastrar uma nova empresa; \n2) Buscar empresa cadastrada por CNPJ; \n3) Buscar empresa por CPF do sócio; \n4) Listar empresas cadastradas em ordem alfabética (baseado na Razão Social); \n5) Excluir uma empresa (por ID); \n0) Sair.\n');

  final screen = stdin.readLineSync()!;

  switch (screen) {
    case '1':
    cadastrarEmpresa();
    break;
    case '2':
    buscarCNPJ();
    break;
    case '3':
    buscarCPF();
    break;
    case '4':
    listar();
    break;
    case '5':
    excluir();
    break;
    case '0':
    print('\nObrigado por usar nosso app, volte sempre!');
    break;
    default:
    print("Opção digitada é inválida, tente novamente!");
    break;
  } while (screen != "0");

}

void cadastrarEmpresa() {
  print('\n1) Pessoa Jurídica; \n2) Pessoa Física.\n');
  final screen = stdin.readLineSync()!;

  if (screen == '1') {
    cadastrarPJ();
  }
  if (screen == '2'){
    cadastrarPF();
  }

}

void cadastrarPJ() {
  final idPJ = uuid.v1();

  print('\nEscreva a Razão Social:');
  final rS = stdin.readLineSync()!;
  print('\nEscreva o Nome Fantasia:');
  final nF = stdin.readLineSync()!;
  print('\nEscreva o CNPJ:');
  final cnpj = stdin.readLineSync()!;
  num cnpjParse = num.parse(cnpj);
  print('\nEscreva o Telefone:');
  final fone = stdin.readLineSync()!;
  num foneParse = num.parse(fone);
  print('\nEscreva o Nome do Sócio:');
  final nome = stdin.readLineSync()!;

  final hora = DateTime.now();

  // Onde devo salvar essas informações?
  // Falta ver o endereço

  var objPJ = [{
    'ID': idPJ,
    'CNPJ': cnpjParse,
    'Data Cadastro': '$hora',
    'Razão Social': rS,
    'Nome Fantasia': nF,
    'Telefone': foneParse,
    // ENDEREÇO
    'Socio': nome,
  }];

  listaPJ.addAll(objPJ);

  print('\n$objPJ');
}

void cadastrarPF() {
  final idPF = uuid.v1();

  print('\nEscreva o Nome:');
  final nome = stdin.readLineSync()!;
  print('\nEscreva o CPF:');
  final cpf = stdin.readLineSync()!;
  num cpfParse = num.parse(cpf);
  // if (cpfParse < 11) {
  //   print('${cpfParse[0][1][2]}.${cpfParse[3][4][5]}.${cpfParse[6][7][8]}-${cpfParse[9][10]}');
  // } 
  // var fomart = formatoCpf(cpfParse);
  print('\nEscreva o Telefone:');
  final fone = stdin.readLineSync()!;
  num foneParse = num.parse(fone);

  final hora = DateTime.now();

  var objPF = [{
    'ID': idPF,
    'Data Cadastro': '$hora',
    'Nome Completo': nome,
    'CPF': cpfParse,
    'Telefone': foneParse,
  }];

  listaPF.addAll(objPF);

  print('\n${objPF[0]['CPF']}');
  print('\n${objPF[0]['CPF'].runtimeType}');
}

Function formatoCpf = (n) {
  // cpf
  if (n == 10) {
    print('${n[0][1][2]}.${n[3][4][5]}.${n[6][7][8]}-${n[9][10]}');
  } 
};

// buscarCNPJ() {};

// buscarCPF() {};

// listar() {};

// excluir() {};
