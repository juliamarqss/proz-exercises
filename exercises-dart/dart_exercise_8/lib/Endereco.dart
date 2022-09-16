class Endereco {
  String logradouro;
  String numero;
  String? complemento;
  String bairro;
  String estado;
  String cep;
  String cidade;

  Endereco({
    required this.logradouro,
    required this.numero,
    this.complemento,
    required this.bairro,
    required this.estado,
    required this.cep,
    required this.cidade
  });

}