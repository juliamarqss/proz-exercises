import 'package:dart_exercise_8/Socio.dart';

class PessoaJuridica extends Socio{
  String cnpj;
  String razaoSocial;
  String? nomeFantasia;

  PessoaJuridica({
    required super.endereco,
    required this.cnpj,
    required this.razaoSocial,
    this.nomeFantasia,
  }) : super(nome: razaoSocial);

}