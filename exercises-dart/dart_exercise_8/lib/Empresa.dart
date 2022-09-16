import 'package:dart_exercise_8/Endereco.dart';
import 'package:dart_exercise_8/PessoaFisica.dart';
import 'package:dart_exercise_8/PessoaJuridica.dart';
import 'package:dart_exercise_8/Socio.dart';

class Empresa {
  String id;
  String cnpj;
  String razaoSocial;
  String? nomeFantasia;
  String? telefone;
  Endereco endereco;
  String horarioDoCadastro;
  PessoaFisica? pf;
  PessoaJuridica? pj;
  // Socio socio;

  Empresa({
    required this.id,
    required this.cnpj,
    required this.razaoSocial,
    this.nomeFantasia,
    this.telefone,
    required this.endereco,
    this.pf,
    this.pj,
    // required this.socio,
    required this.horarioDoCadastro,
  });
}