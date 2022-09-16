import 'package:dart_exercise_8/Socio.dart';

class Empresa {
  String? id;
  String? telefone;
  Socio socio;
  String? horarioDoCadastro;

  Empresa({
    this.id,
    this.telefone,
    required this.socio,
    this.horarioDoCadastro,
  });
}