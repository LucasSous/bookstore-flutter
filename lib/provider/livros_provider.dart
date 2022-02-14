// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:asuka/snackbars/asuka_snack_bar.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:livraria_mobile/models/model_livros.dart';

class LivrosProvider with ChangeNotifier {
  final _baseURL = 'https://livraria--back.herokuapp.com/api/';

  Future<List<Livros>> loadBooks() async {
    final response = await http.get(Uri.parse(_baseURL + 'livros'));
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Livros> listBooks = [];

    for (var livro in data) {
      listBooks.add(Livros(
        id: livro['id'].toString(),
        nome: livro['nome'],
        autor: livro['autor'],
        editora: livro['editora'],
        lancamento: livro['lancamento'],
        quantidade: livro['quantidade'],
      ));
    }

    return listBooks;
  }
}
