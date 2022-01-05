import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VisualizarModal extends StatelessWidget {
  Map<String, dynamic> usuario;
  VisualizarModal({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
      body: Container(
        padding: const EdgeInsets.all(30),
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Dados do Usuário',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Código: ' '${usuario['id']}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'Nome: ' + usuario['nome'],
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'Endereço: ' + usuario['endereco'],
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'Cidade: ' + usuario['cidade'],
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'E-mail: ' + usuario['email'],
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
