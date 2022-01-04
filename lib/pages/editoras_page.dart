import 'package:flutter/material.dart';

class EditorasPage extends StatefulWidget {
  const EditorasPage({Key? key}) : super(key: key);

  @override
  _EditorasPageState createState() => _EditorasPageState();
}

class _EditorasPageState extends State<EditorasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editoras'),
        backgroundColor: const Color(0xff212529),
      ),
    );
  }
}
