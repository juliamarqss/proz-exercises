import 'package:dart_exercise_8/endereco.dart';

abstract class Socio {
  String nome;
  Endereco endereco;
  String documento;
  
  Socio( this.documento, {
    required this.nome,
    required this.endereco,
  });
  
}
