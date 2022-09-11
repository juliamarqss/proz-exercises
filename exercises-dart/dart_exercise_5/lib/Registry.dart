abstract class Registry {
  String name;
  String cpf;

  Registry({
    required this.name,
    required this.cpf,
  });

  void rmvClient() {}
}