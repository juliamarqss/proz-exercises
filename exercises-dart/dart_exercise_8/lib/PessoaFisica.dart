import 'package:dart_exercise_8/Socio.dart';

class PessoaFisica extends Socio {
  String cpf;

  PessoaFisica({
    required super.nome,
    required this.cpf,
    required super.endereco,
  });
}