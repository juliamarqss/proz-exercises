class Empresa {
  String id;
  String? cnpj;
  String razaoSocial;
  String? nomeFantasia;
  String? telefone;
  String endereco;
  // Endereco endereco;
  String horarioDoCadastro;
  Map? pf;
  Map? pj;

  Empresa({
    required this.id,
    this.cnpj,
    required this.razaoSocial,
    this.nomeFantasia,
    this.telefone,
    required this.endereco,
    this.pf,
    this.pj,
    required this.horarioDoCadastro,
  });
}