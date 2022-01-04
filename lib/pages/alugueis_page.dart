import 'package:flutter/material.dart';

class AlugueisPage extends StatefulWidget {
  const AlugueisPage({Key? key}) : super(key: key);

  @override
  _AlugueisPageState createState() => _AlugueisPageState();
}

class _AlugueisPageState extends State<AlugueisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aluguéis'),
        backgroundColor: const Color(0xff212529),
      ),
    );
  }
}
