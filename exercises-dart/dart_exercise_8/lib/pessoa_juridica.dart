import 'package:dart_exercise_8/socio.dart';

class PessoaJuridica extends Socio{
  String cnpj;
  String razaoSocial;
  String? nomeFantasia;

  PessoaJuridica({
    required super.endereco,
    required this.cnpj,
    required this.razaoSocial,
    this.nomeFantasia,
  }) : super(cnpj, nome: razaoSocial);

}