import 'package:dart_exercise_8/Empresa.dart';

class PessoaFisica extends Empresa {
  PessoaFisica({
    required super.id,
    required super.telefone,
    required super.socio,
    required super.endereco,
    required super.horarioDoCadastro,
  });
}