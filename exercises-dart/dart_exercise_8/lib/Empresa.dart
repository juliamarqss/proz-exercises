import 'package:dart_exercise_8/socio.dart';
import 'package:dart_exercise_8/endereco.dart';

class Empresa {
  String id;
  String cnpjEmp;
  String razaoSocialEmp;
  String? nomeFantasiaEmp;
  String? telefone;
  Endereco? enderecoEmp;
  // Endereco endereco;
  String dataCadastro;
  Socio? socio;

  Empresa({
    required this.id,
    required this.cnpjEmp,
    required this.razaoSocialEmp,
    this.nomeFantasiaEmp,
    this.telefone,
    required this.enderecoEmp,
    this.socio,
    required this.dataCadastro,
  });

  String get cnpjFormat {
    if(cnpjEmp.length == 14) {
      final format = '${cnpjEmp.substring(0,2)}.${cnpjEmp.substring(2,5)}.${cnpjEmp.substring(5,8)}/${cnpjEmp.substring(8,12)}-${cnpjEmp.substring(12,14)}';
      return format;
    }
    return cnpjEmp;
  }
}