class Usuarios {
  dynamic id;
  String nome;
  String endereco;
  String cidade;
  String email;

  Usuarios(
      {this.id,
      required this.nome,
      required this.endereco,
      required this.cidade,
      required this.email});
}
