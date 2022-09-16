import 'dart:io';
import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:dart_exercise_8/Socio.dart';
import 'package:uuid/uuid.dart';
import 'package:dart_exercise_8/Empresa.dart';
import 'package:dart_exercise_8/Endereco.dart';
import 'package:dart_exercise_8/PessoaFisica.dart';
import 'package:dart_exercise_8/PessoaJuridica.dart';

var lista = [];

final uuid = Uuid();
final geradorID = uuid.v1();
final hora = DateTime.now();

void main() {
  PessoaFisica socio1 = PessoaFisica(
    cpf: '76367980008', // fazer função da formatação
    nome: 'Mirella Kamilly Letícia Barbosa',
    endereco: Endereco(
      logradouro: 'Rua Dom Moura',
      numero: '39',
      bairro: 'Upatininga',
      estado: 'PE',
      cep: '55896970', // fazer função da formatação
    ),
  ); 

  PessoaJuridica socio2 = PessoaJuridica(
    cnpj: '87009263000140', // fazer função da formatação
    razaoSocial: 'Lavínia e Tereza Locações de Automóveis Ltda',
    nomeFantasia: 'Loc. Auto',
    endereco: Endereco(
      logradouro: 'Praça Valdomiro Tino de Medeiros',
      numero: '165',
      bairro: 'Centro',
      estado: 'PE',
      cep: '55375970', // fazer função da formatação
    ),
  );

  Empresa empresa1 = Empresa(
    id: geradorID,
    cnpj: '18862697000175', // fazer função da formatação
    razaoSocial: 'Ruan e Sophia Esportes ME',
    telefone: '1135134023', // fazer função da formatação
    endereco: Endereco(
      logradouro: 'Sete de Setembro',
      numero: '322',
      bairro: 'Bela Vista',
      estado: 'Estado',
      cep: '17037850', // fazer função da formatação
    ),
    horarioDoCadastro: '$hora',
  );

  Empresa empresa2 = Empresa(
    id: geradorID,
    cnpj: '654646465',
    razaoSocial: '',
    nomeFantasia: '',
    telefone: '',
    endereco: Endereco(
      logradouro: 'Avenida Manoel Borba',
      numero: '29',
      bairro: 'Centro',
      estado: 'PE',
      cep: '55470970', // fazer função da formatação
    ),
    horarioDoCadastro: '$hora',
  );
  
  print(empresa2.endereco.bairro);
  lista.add(empresa2);
  print(lista[0].endereco.numero);

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
  print(lista);
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
    final enderecoEmp = endereco();
    
    final foneEmp = telefone();
    
    print('\nO tipo do sócio é: \n1) Pessoa Jurídica; \n2) Pessoa Física.\n');
    final screen = stdin.readLineSync()!;

    if (screen == '1') {
      var objEmpresa1 = [{
      'ID': geradorID,
      'CNPJ': cnpj,
      'Data de Cadastro': '$hora',
      'Razão Social': rS,
      'Nome Fantasia': nF,
      'Telefone': foneEmp,
      'Endereço': enderecoEmp,
      'Socio': registrarPJ(),
      }];
      Empresa emp1 = Empresa(
        cnpj: cnpj,
        horarioDoCadastro: '$hora',  
        endereco: Endereco(
          bairro: '',
          cep: '',
          estado: '',
          logradouro: '',
          numero: '',
          complemento: ''
        ),
        id: geradorID,
        razaoSocial: rS,
        nomeFantasia: nF,
        pj: PessoaJuridica(
          cnpj: enderecoEmp,
          endereco: Endereco(
            bairro: '',
            cep: '',
            estado: '',
            logradouro: '',
            numero: ''
          ),
          razaoSocial: ''
        ),
        telefone: foneEmp,
      );
      lista.addAll(objEmpresa1);
    }

    if (screen == '2'){
      var objEmpresa2 = [{
      'ID': geradorID,
      'CNPJ': cnpj,
      'Data de Cadastro': '$hora',
      'Razão Social': rS,
      'Nome Fantasia': nF,
      'Telefone': foneEmp,
      'Endereço': enderecoEmp,
      'Socio': registrarPF(),
      }];
      lista.addAll(objEmpresa2);
    }
  }
}

Map registrarPJ() {
  print('\nEscreva a Razão Social:');
  final rS = stdin.readLineSync()!;

  print('\nEscreva o Nome Fantasia:');
  final nF = stdin.readLineSync()!;

  print('\nEscreva o CNPJ:');
  final cnpj = stdin.readLineSync()!;
  if (!CNPJValidator.isValid(cnpj)){
    return {'Erro': 'Digite novamente!'};
  } else {

    var objPJ = {
      'CNPJ': cnpj,
      'Razão Social': rS,
      'Nome Fantasia': nF,
      'Endereço': endereco(),
    };

    return objPJ;
  }
}

Map registrarPF() {
  print('\nEscreva o Nome:');
  final nome = stdin.readLineSync()!;

  print('\nEscreva o CPF:');
  final cpf = stdin.readLineSync()!;
  if (!CPFValidator.isValid(cpf)){
    return {'Erro':'Digite novamente!'};
  } else {

    var objPF = {
      'Nome Completo': nome,
      'CPF': cpf,
      'Endereço': endereco(),
    };
    return objPF;
  }
}

String endereco() {
  print('\nEscreva a Rua:');
  final rua = stdin.readLineSync()!;

  print('\nEscreva o Número:');
  final numero = stdin.readLineSync()!;

  print('\nEscreva o Complemento:');
  final complemento = stdin.readLineSync()!;

  print('\nEscreva o Bairro:');
  final bairro = stdin.readLineSync()!;

  print('\nEscreva o Cidade:');
  final cidade = stdin.readLineSync()!;
  
  print('\nEscreva o Estado:');
  final estado = stdin.readLineSync()!;
  final estHigh = estado.toUpperCase();

  print('\nEscreva o CEP:');
  final cep = stdin.readLineSync()!;
  final cepFormat = '${cep.substring(0,5)}-${cep.substring(5,8)}';

  var formato = '$rua, $numero, $complemento, $bairro, $cidade/$estHigh, $cepFormat';
  var formato2 = '$rua, $numero, $bairro, $cidade/$estHigh, $cepFormat';

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
