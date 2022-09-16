import 'dart:io';

import 'package:dart_exercise_8/Endereco.dart';

abstract class Socio {
  String nome;
  Endereco endereco;
  
  Socio({
    required this.nome,
    required this.endereco,
  });
}
