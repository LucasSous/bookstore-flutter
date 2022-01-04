// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:livraria_mobile/pages/usuario_form.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key? key}) : super(key: key);

  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  Future<List> pegarUsuario() async {
    var url = Uri.parse('https://livraria--back.herokuapp.com/api/usuarios');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Erro ao carregar dados do servidor!');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
        elevation: 0,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => UsuarioForm()));
              },
              icon: Icon(Icons.add))
        ],
        backgroundColor: const Color(0xff212529),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: FutureBuilder<List>(
          future: pegarUsuario(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Erro ao carregar usuário'),
              );
            }

            if (snapshot.hasData) {
              // ignore: avoid_unnecessary_containers
              return Column(
                children: [
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: 50,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: size.height * 0.1 - 50,
                          decoration: BoxDecoration(
                            color: Color(0xff212529),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            height: 44,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 5,
                                      color: Colors.grey.withOpacity(0.50))
                                ]),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Pesquisar',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    suffixIcon: Icon(Icons.search)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 7),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5))),
                            child: ListTile(
                              title: Text(snapshot.data![index]['nome']),
                              subtitle: Text(snapshot.data![index]['email']),
                              // ignore: sized_box_for_whitespace
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                        onPressed: () {},
                                        color: Colors.blue,
                                        icon: const Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () {},
                                        color: Colors.red,
                                        icon: const Icon(Icons.delete))
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
