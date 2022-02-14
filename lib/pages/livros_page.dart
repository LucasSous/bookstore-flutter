// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:livraria_mobile/components/livros_list.dart';
import 'package:livraria_mobile/provider/livros_provider.dart';
import 'package:livraria_mobile/routes/app_rounts.dart';
import 'package:provider/provider.dart';

class LivrosPage extends StatefulWidget {
  const LivrosPage({Key? key}) : super(key: key);

  @override
  _LivrosPageState createState() => _LivrosPageState();
}

class _LivrosPageState extends State<LivrosPage> {
  String filterText = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final livros = Provider.of<LivrosProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Livros',
          style: TextStyle(color: Color(0xFFBDBDBD)),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PUBLISHER_FORM);
              },
              icon: Icon(Icons.add),
              color: Color(0xFFBDBDBD))
        ],
        backgroundColor: const Color(0xff212529),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
        ),
        child: FutureBuilder(
          future: livros.loadBooks(),
          builder: (BuildContext context, AsyncSnapshot livro) {
            if (livro.hasError) {
              return const Center(
                child: Text('Erro ao carregar editoras'),
              );
            }

            if (livro.hasData) {
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
                                  horizontal: 10, vertical: 10),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Pesquisar',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    suffixIcon: Icon(Icons.search)),
                                onChanged: (text) {
                                  setState(() {
                                    filterText = text;
                                  });
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      child: ListView.builder(
                          itemCount: livro.data!.length,
                          itemBuilder: (ctx, i) => LivrosList(livro.data[i])),
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
