// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:asuka/snackbars/asuka_snack_bar.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:livraria_mobile/models/model_editoras.dart';

class EditorasProvider with ChangeNotifier {
  final _baseURL = 'https://livraria--back.herokuapp.com/api/';

  Future<List<Editoras>> loadPublishers() async {
    final response = await http.get(Uri.parse(_baseURL + 'editoras'));
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Editoras> listPublisher = [];

    for (var editora in data) {
      listPublisher.add(Editoras(
        id: editora['id'].toString(),
        nome: editora['nome'],
        cidade: editora['cidade'],
      ));
    }

    return listPublisher;
  }

  Future<void> save(Editoras editoras) async {
    // ignore: unnecessary_null_comparison
    if (editoras != null) {
      final response = await http.post(Uri.parse(_baseURL + 'editora'),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          body: jsonEncode({
            'nome': editoras.nome,
            'cidade': editoras.cidade,
          }),
          encoding: Encoding.getByName("utf-8"));
      if (response.statusCode == 200) {
        AsukaSnackbar.success("Editora salva com sucesso!").show();
      } else {
        AsukaSnackbar.alert("Erro ao tentar salvar a editora!").show();
      }
      notifyListeners();
    }
  }

  Future<void> update(Editoras editoras) async {
    // ignore: unnecessary_null_comparison
    if (editoras != null && editoras.id != null) {
      final response = await http.put(Uri.parse(_baseURL + 'editora'),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          body: jsonEncode({
            'id': editoras.id,
            'nome': editoras.nome,
            'cidade': editoras.cidade,
          }),
          encoding: Encoding.getByName("utf-8"));
      if (response.statusCode == 200) {
        AsukaSnackbar.success("Editora alterada com sucesso!").show();
      } else {
        AsukaSnackbar.alert("Erro ao tentar alterar a editora!").show();
      }
      notifyListeners();
    }
  }

  Future<void> remove(Editoras editoras) async {
    // ignore: unnecessary_null_comparison
    if (editoras != null) {
      final response = await http.delete(Uri.parse(_baseURL + 'editora'),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          body: jsonEncode({
            'id': editoras.id,
            'nome': editoras.nome,
            'cidade': editoras.cidade,
          }),
          encoding: Encoding.getByName("utf-8"));
      if (response.statusCode == 200) {
        AsukaSnackbar.success("Editora deletada com sucesso!").show();
      } else {
        AsukaSnackbar.alert("Erro ao tentar deletar a editora!").show();
      }
      notifyListeners();
    }
  }
}
