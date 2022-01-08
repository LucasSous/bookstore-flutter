import 'package:flutter/material.dart';
import 'package:livraria_mobile/models/model_usuarios.dart';

// ignore: must_be_immutable
class VisualizarModal extends StatelessWidget {
  final Usuarios usuario;
  const VisualizarModal({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: 500,
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
            const Text(
              'Código: ',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              '${usuario.id}',
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF757575),
              ),
            ),
            const Text(
              'Nome: ',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              usuario.nome,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF757575),
              ),
            ),
            const Text(
              'Endereço: ',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              usuario.endereco,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF757575),
              ),
            ),
            const Text(
              'Cidade: ',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              usuario.cidade,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF757575),
              ),
            ),
            const Text(
              'E-mail: ',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              usuario.email,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF757575),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}
