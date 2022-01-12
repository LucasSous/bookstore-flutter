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
        fixedColor: Color(0xff212529),
        iconSize: 25,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Início',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined),
              label: 'Usuários',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.align_vertical_bottom_sharp),
              label: 'Editoras',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.book_outlined,
              ),
              label: 'Livros',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
              ),
              label: 'Aluguéis',
              backgroundColor: Colors.white),
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
