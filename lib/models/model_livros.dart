import 'package:livraria_mobile/models/model_editoras.dart';

class Livros {
  dynamic id;
  dynamic nome;
  dynamic autor;
  Editoras editora;
  int lancamento;
  int quantidade;

  Livros({
    this.id,
    required this.nome,
    required this.autor,
    required this.editora,
    required this.lancamento,
    required this.quantidade,
  });
}
