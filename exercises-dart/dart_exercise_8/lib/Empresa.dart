abstract class Empresa {
  String id;
  String? razaoSocial;
  String? nomeFantasia;
  String? cnpj;
  String telefone;
  String socio;
  String endereco; // como colocar as outras keys
  DateTime horarioDoCadastro;

  Empresa({
    required this.id,
    this.razaoSocial,
    this.nomeFantasia,
    this.cnpj,
    required this.telefone,
    required this.socio,
    required this.endereco,
    required this.horarioDoCadastro,
  });

  void geradorId() {

  }

  void formatoCpf() {
    
  }
}