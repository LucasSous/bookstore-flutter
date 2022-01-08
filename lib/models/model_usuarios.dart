class Usuarios {
  final dynamic id;
  final String nome;
  final String endereco;
  final String cidade;
  final String email;

  const Usuarios(
      {this.id,
      required this.nome,
      required this.endereco,
      required this.cidade,
      required this.email});
}
