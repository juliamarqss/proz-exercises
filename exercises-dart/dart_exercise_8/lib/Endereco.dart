class Endereco {
  String logradouro;
  String numero;
  String? complemento;
  String bairro;
  String estado;
  String cep;

  Endereco({
    required this.logradouro,
    required this.numero,
    this.complemento,
    required this.bairro,
    required this.estado,
    required this.cep,
  });

}