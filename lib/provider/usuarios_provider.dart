import 'dart:convert';

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
    if (usuarios != null) {
      await http.post(Uri.parse(_baseURL + 'usuario'),
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
      notifyListeners();
    }
  }

  Future<void> update(Usuarios usuarios) async {
    if (usuarios != null && usuarios.id != null) {
      await http.put(Uri.parse(_baseURL + 'usuario'),
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
      notifyListeners();
    }
  }
}
