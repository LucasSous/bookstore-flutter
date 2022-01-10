import 'package:flutter/material.dart';
import 'package:livraria_mobile/pages/alugueis_page.dart';
import 'package:livraria_mobile/pages/dashboard_page.dart';
import 'package:livraria_mobile/pages/editoras_page.dart';
import 'package:livraria_mobile/pages/livros_page.dart';
import 'package:livraria_mobile/pages/usuarios_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: const [
          DashboardPage(),
          UsuariosPage(),
          EditorasPage(),
          LivrosPage(),
          AlugueisPage(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        // ignore: prefer_const_constructors
        fixedColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
              backgroundColor: Color(0xff212529)),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Usuários',
              backgroundColor: Color(0xff212529)),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Editoras',
              backgroundColor: Color(0xff212529)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.book,
              ),
              label: 'Livros',
              backgroundColor: Color(0xff212529)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
              ),
              label: 'Aluguéis',
              backgroundColor: Color(0xff212529)),
        ],
        onTap: (pagina) {
          pc.animateToPage(pagina,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        },
      ),
    );
  }
}
