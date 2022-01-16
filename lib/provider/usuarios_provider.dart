import 'dart:convert';

import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:livraria_mobile/models/model_usuarios.dart';

class UsuariosProvider with ChangeNotifier {
  final _baseURL = 'https://livraria--back.herokuapp.com/api/';

  Future<List<Usuarios>> loadUsers() async {
    final response = await http.get(Uri.parse(_baseURL + '/usuarios'));
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Usuarios> listUsuarios = [];

    for (var usuario in data) {
      listUsuarios.add(Usuarios(
          id: usuario['id'].toString(),
          nome: usuario['nome'],
          endereco: usuario['endereco'],
          cidade: usuario['cidade'],
          email: usuario['email']));
    }

    return listUsuarios;
  }

  Future<void> save(Usuarios usuarios) async {
    // ignore: unnecessary_null_comparison
    if (usuarios != null) {
      final response = await http.post(Uri.parse(_baseURL + 'usuario'),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          body: jsonEncode({
            'nome': usuarios.nome,
            'endereco': usuarios.endereco,
            'cidade': usuarios.cidade,
            'email': usuarios.email,
          }),
          encoding: Encoding.getByName("utf-8"));
      if (response.statusCode == 200) {
        AsukaSnackbar.success("Usuário salvo com sucesso!").show();
      } else {
        AsukaSnackbar.alert("Erro ao tentar salvar o usuário!").show();
      }
      notifyListeners();
    }
  }

  Future<void> update(Usuarios usuarios) async {
    // ignore: unnecessary_null_comparison
    if (usuarios != null && usuarios.id != null) {
      final response = await http.put(Uri.parse(_baseURL + 'usuario'),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          body: jsonEncode({
            'id': usuarios.id,
            'nome': usuarios.nome,
            'endereco': usuarios.endereco,
            'cidade': usuarios.cidade,
            'email': usuarios.email,
          }),
          encoding: Encoding.getByName("utf-8"));
      if (response.statusCode == 200) {
        AsukaSnackbar.success("Usuário editado com sucesso!").show();
      } else {
        AsukaSnackbar.alert("Erro ao tentar editar o usuário!").show();
      }
      notifyListeners();
    }
  }

  Future<void> remove(Usuarios usuarios) async {
    // ignore: unnecessary_null_comparison
    if (usuarios != null) {
      final response = await http.delete(Uri.parse(_baseURL + 'usuario'),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          body: jsonEncode({
            'id': usuarios.id,
            'nome': usuarios.nome,
            'endereco': usuarios.endereco,
            'cidade': usuarios.cidade,
            'email': usuarios.email,
          }),
          encoding: Encoding.getByName("utf-8"));
      if (response.statusCode == 200) {
        AsukaSnackbar.success("Usuário deletado com sucesso!").show();
      } else {
        AsukaSnackbar.alert("Erro ao tentar deletar o usuário!").show();
      }
      notifyListeners();
    }
  }
}
