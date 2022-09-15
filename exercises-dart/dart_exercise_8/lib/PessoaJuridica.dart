import 'package:dart_exercise_8/Empresa.dart';

class PessoaJuridica extends Empresa {
  PessoaJuridica({
    required super.id,
    required super.razaoSocial,
    required super.nomeFantasia,
    required super.cnpj,
    required super.telefone,
    required super.socio,
    required super.endereco,
    required super.horarioDoCadastro,
  });
}