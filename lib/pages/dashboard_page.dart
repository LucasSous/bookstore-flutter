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
          title: const Text(
            'Dashboard',
            style: TextStyle(color: Color(0xFFBDBDBD)),
          ),
          elevation: 0,
          backgroundColor: const Color(0xff212529),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(color: Color(0xFFF5F5F5)),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  decoration: const BoxDecoration(color: Color(0xFFF5F5F5)),
                  child: Stack(
                    children: [
                      Container(
                        height: size.height * 0.3 - 50,
                        decoration: const BoxDecoration(
                            color: Color(0xff212529),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(26),
                                bottomRight: Radius.circular(26))),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            height: MediaQuery.of(context).size.height / 1.3,
                            width: MediaQuery.of(context).size.height / 1,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      spreadRadius: 0.1,
                                      blurRadius: 5,
                                      color: Colors.black26)
                                ]),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                FutureBuilder(
                                    future: usuarios.loadUsers(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot usuarios) {
                                      return ListTile(
                                        leading: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF0077FF)
                                                .withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: const Icon(
                                            Icons.group_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                        title: const Text('Usuários'),
                                        trailing:
                                            Text('${usuarios.data?.length}'),
                                      );
                                    }),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 0),
                                  child: const Divider(
                                    color: Colors.black12,
                                    height: 10,
                                  ),
                                ),
                                FutureBuilder(
                                    future: usuarios.loadUsers(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot usuarios) {
                                      return ListTile(
                                        leading: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF006CAA)
                                                .withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: const Icon(
                                            Icons.book_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                        title: const Text('Livros'),
                                        trailing:
                                            Text('${usuarios.data?.length}'),
                                      );
                                    }),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 0),
                                  child: const Divider(
                                    color: Colors.black12,
                                    height: 10,
                                  ),
                                ),
                                FutureBuilder(
                                    future: editoras.loadPublishers(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot editoras) {
                                      return ListTile(
                                        leading: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFDB2D2D)
                                                .withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: const Icon(
                                            Icons.align_vertical_bottom_sharp,
                                            color: Colors.white,
                                          ),
                                        ),
                                        title: const Text('Editoras'),
                                        trailing:
                                            Text('${editoras.data?.length}'),
                                      );
                                    }),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 0),
                                  child: const Divider(
                                    color: Colors.black12,
                                    height: 10,
                                  ),
                                ),
                                FutureBuilder(
                                    future: usuarios.loadUsers(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot usuarios) {
                                      return ListTile(
                                        leading: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF198754)
                                                .withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: const Icon(
                                            Icons.calendar_today,
                                            color: Colors.white,
                                          ),
                                        ),
                                        title: const Text('Aluguéis'),
                                        trailing:
                                            Text('${usuarios.data?.length}'),
                                      );
                                    }),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
