import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:dart_exercise_8/empresa.dart';
import 'package:dart_exercise_8/endereco.dart';
import 'package:dart_exercise_8/socio.dart';
import 'package:dart_exercise_8/pessoa_fisica.dart';
import 'package:dart_exercise_8/pessoa_juridica.dart';

var lista = [];

final uuid = Uuid();
final geradorID = uuid.v1();
final hora = DateTime.now();

class Funcoes {

void cadastrarEmpresa() {
  registrarEmpresa();
  print('\nCadastrado com sucesso!');
  // print(lista[0]);
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

    final enderecoEmp = cadastrarEnd();

    Socio socio;

    final foneEmp = telefone();

    print('\nO tipo do sócio é: \n1) Pessoa Jurídica; \n2) Pessoa Física.\n');
    final screen = stdin.readLineSync()!;

    if (screen == '1') {
      socio = cadastrarSocio(screen);
      Empresa emp1 = Empresa(
        cnpjEmp: cnpjFormat,
        dataCadastro: '$hora',  
        enderecoEmp: enderecoEmp,
        id: geradorID,
        razaoSocialEmp: rS,
        nomeFantasiaEmp: nF,
        socio: socio,
        telefone: foneEmp,
      );
      lista.add(emp1);
    } else if (screen == '2'){
      socio = cadastrarSocio(screen);
      Empresa emp2 = Empresa(
        cnpjEmp: cnpjFormat,
        dataCadastro: '$hora',  
        enderecoEmp: enderecoEmp,
        id: geradorID,
        razaoSocialEmp: rS,
        nomeFantasiaEmp: nF,
        socio: socio,
        telefone: foneEmp,
      );
      lista.add(emp2);
    } else {
      print('Opção inválida!');
    }
  }
}

Endereco cadastrarEnd() {
  String logradouro;
  String numero;
  String? complemento;
  String bairro;
  String cidade;
  String estado;

  print('\nPreencher os dados do endereço ↓');
  print('Logradouro:');
  final r = stdin.readLineSync()!;
  logradouro = r;

  print('\nNúmero:');
  final n = stdin.readLineSync()!;
  numero = n;

  print('\nComplemento:');
  final c = stdin.readLineSync()!;
  complemento = c;

  print('\nBairro:');
  final b = stdin.readLineSync()!;
  bairro = b;

  print('\nCidade:');
  final ci = stdin.readLineSync()!;
  cidade = ci;

  print('\nEstado:');
  final e = stdin.readLineSync()!;
  final estHigh = e.toUpperCase();
  estado = estHigh;

  print('\nCEP:');
  final cep = stdin.readLineSync()!;
  final cepFormat = '${cep.substring(0,5)}-${cep.substring(5,8)}';

  return Endereco(
    bairro: bairro,
    cep: cepFormat,
    estado: estado,
    logradouro: logradouro,
    numero: numero,
    complemento: complemento,
    cidade: cidade,
  );
  // var formato = '${end1.logradouro}, ${end1.numero}, ${end1.complemento}, ${end1.bairro}, ${end1.cidade}/${end1.estado}, ${end1.cep}';
}

// VERIFICAR O ERRO DO TELEFONE
String? telefone() {
  print('\nEscreva o Telefone:');
  final fone = stdin.readLineSync()!;

  if(fone.length > 9) {
    String texto = 'Digite novamente!';
    print(texto);
    return null;
  } else {
    // print('AQUII');
    final foneFormat = '${fone.substring(0,5)}-${fone.substring(5,9)}';
    return foneFormat;
  }  
}

String? formatoCNPJ() {
  print('\nEscreva o CNPJ:');
  final cnpj = stdin.readLineSync()!;

  if(!CNPJValidator.isValid(cnpj)) {
    print('Digite Novamente!');
    return null;
  } else {
    final cnpjFormat = '${cnpj.substring(0,2)}.${cnpj.substring(2,5)}.${cnpj.substring(5,8)}/${cnpj.substring(8,12)}-${cnpj.substring(12,14)}';
    return cnpjFormat;
  }
}

Socio cadastrarSocio(input) {
  String nome;
  String razaoS;
  String nomef;
  Endereco end;
  String documento;

  if (input == '1') {
    print('\nPreencher os dados do Sócio PJ ↓');
    print('\nEscreva a Razão Social:');
    final rS = stdin.readLineSync()!;
    razaoS = rS;
    print('\nEscreva o Nome Fantasia:');
    final nF = stdin.readLineSync()!;
    nomef = nF;

    print('\nEscreva o CNPJ:');
    final cnpj = stdin.readLineSync()!;
    documento = cnpj;
    
    end = cadastrarEnd();

    while(!CNPJValidator.isValid(documento)){ 
      print('CNPJ deve conter apenas os números!');
    }

    return PessoaJuridica(
      endereco: end,
      cnpj: documento,
      razaoSocial: razaoS,
      nomeFantasia: nomef,
    );

  } else {
    print('\nPreencher os dados do Sócio PF ↓');
    print('\nEscreva o Nome:');
    final n = stdin.readLineSync()!;
    nome = n;

    end = cadastrarEnd();

    print('\nEscreva o CPF:');
    final cpf = stdin.readLineSync()!;
    while (!CPFValidator.isValid(cpf)){
      print('Digite novamente!');
    } 
    
    return PessoaFisica(
      nome: nome,
      cpf: cpf,
      endereco: end,
    );
  }
}

void buscarCNPJ() {
  if(lista.isEmpty){
    print('Não é possível realizar essa ação no momento.\n(É necessário adicionar uma empresa a lista)');
  } else {
    print('Digite o CNPJ que deseja buscar:');
    final cnpj = stdin.readLineSync()!;

    for (var i in lista) {
      if (i.exibir == cnpj) {
      exibir(i);
      } else {
        print('CNPJ não encontrado.');
      }
    }
  }
}

void buscarCPF() {
  if(lista.isEmpty){
    print('Não é possível realizar essa ação no momento.\n(É necessário adicionar uma empresa a lista)');
  } else {
    print('Digite o CPF que deseja buscar:');
    final cpf = stdin.readLineSync()!;

    for (var i in lista) {
      if (i.exibir == cpf) {
      exibir(i);
      } else {
        print('CPF não encontrado.');
      }
    }
  }
}

void listar() {
  if (lista.isEmpty) {
    print('\nA lista está vázia');
  } else {
    print('\nLista de Empresas Cadastradas: ↓\n');

    lista.sort((a, b) => a.cnpjEmp.compareTo(b.cnpjEmp));

    for(var i in lista){
      print('ID: ${i.id}');
      print('CNPJ: ${i.cnpjFormat}');
      print('Razão Social: ${i.razaoSocialEmp}');
    }
  }
}

void exibir(Empresa empresa) {
  print('ID: ${empresa.id}');
  print('CNPJ: ${empresa.cnpjEmp} Data Cadastro: ${empresa.dataCadastro}');
  print('Razão Social: ${empresa.razaoSocialEmp}');
  print('Nome Fantasia: ${empresa.nomeFantasiaEmp}');
  print('Telefone: ${empresa.telefone}');
  print('Endereço: ${empresa.enderecoEmp}');
  print('Sócio:');
  print('CPF: ${empresa.socio?.documento}');
  print('Nome Completo: ${empresa.socio?.nome}');
  print('Endereço: ${empresa.socio?.endereco.logradouro}, ${empresa.socio?.endereco.numero}, ${empresa.socio?.endereco.complemento}, ${empresa.socio?.endereco.bairro}, ${empresa.socio?.endereco.cidade}/${empresa.socio?.endereco.estado}, ${empresa.socio?.endereco.cepFormat}'); 
}

void excluir(empId, input) {
  if (lista.isEmpty) {
    print('Não é possível realizar essa ação no momento.\n(É necessário adicionar uma empresa a lista)');
  } else {
    if(input > lista.length){
      print('ID não encontrado.');
    } else {
      for(var i in lista) {
        if(i.id == empId){
          print('Tem certeza que deseja remover a empresa ${i.razaoSocialEmp}?');
          print('1)Sim  2)Não');
          var valor = stdin.readLineSync()!;

          if(valor == '1'){
            lista.removeWhere((item) => item.id == empId);
            print('Empresa removida com sucesso!');
          }
        }

      }
    }
  }
}

}