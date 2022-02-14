// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:livraria_mobile/provider/editoras_provider.dart';
import 'package:provider/provider.dart';
import 'package:livraria_mobile/provider/usuarios_provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final usuarios = Provider.of<UsuariosProvider>(context);
    final editoras = Provider.of<EditorasProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        elevation: 0,
        backgroundColor: const Color(0xff212529),
      ),
      body: Container(
          decoration: const BoxDecoration(color: Color(0xff212529)),
          child: Container(
            decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36)),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 0.1, blurRadius: 5, color: Colors.black26)
                ]),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
                  child: FutureBuilder(
                      future: usuarios.loadUsers(),
                      builder: (BuildContext context, AsyncSnapshot usuarios) {
                        return ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0077FF).withOpacity(0.7),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(
                              Icons.group_outlined,
                              color: Colors.white,
                            ),
                          ),
                          title: const Text('Usuários'),
                          trailing: Text('${usuarios.data?.length}'),
                        );
                      }),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
                  child: FutureBuilder(
                      future: usuarios.loadUsers(),
                      builder: (BuildContext context, AsyncSnapshot usuarios) {
                        return ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF006CAA).withOpacity(0.7),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(
                              Icons.book_outlined,
                              color: Colors.white,
                            ),
                          ),
                          title: const Text('Livros'),
                          trailing: Text('${usuarios.data?.length}'),
                        );
                      }),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
                  child: FutureBuilder(
                      future: editoras.loadPublishers(),
                      builder: (BuildContext context, AsyncSnapshot editoras) {
                        return ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFDB2D2D).withOpacity(0.7),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(
                              Icons.align_vertical_bottom_sharp,
                              color: Colors.white,
                            ),
                          ),
                          title: const Text('Editoras'),
                          trailing: Text('${editoras.data?.length}'),
                        );
                      }),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5))),
                  child: FutureBuilder(
                      future: usuarios.loadUsers(),
                      builder: (BuildContext context, AsyncSnapshot usuarios) {
                        return ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF198754).withOpacity(0.7),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                            ),
                          ),
                          title: const Text('Aluguéis'),
                          trailing: Text('${usuarios.data?.length}'),
                        );
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
