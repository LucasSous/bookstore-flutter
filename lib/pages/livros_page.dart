import 'package:flutter/material.dart';

class LivrosPage extends StatefulWidget {
  const LivrosPage({Key? key}) : super(key: key);

  @override
  _LivrosPageState createState() => _LivrosPageState();
}

class _LivrosPageState extends State<LivrosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Livros'),
        backgroundColor: const Color(0xff212529),
      ),
    );
  }
}
