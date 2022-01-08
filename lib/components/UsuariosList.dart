// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:livraria_mobile/components/visualizar_modal.dart';
import 'package:livraria_mobile/models/model_usuarios.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class UsuariosList extends StatelessWidget {
  final Usuarios usuarios;

  const UsuariosList(this.usuarios);

  @override
  Widget build(BuildContext context) {
    void _visualizarModal() {
      showBarModalBottomSheet(
          context: context,
          builder: (context) => VisualizarModal(
                usuario: usuarios,
              ));
    }

    void onSelected(BuildContext context, int item) {
      switch (item) {
        case 0:
          _visualizarModal();
          break;
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5))),
      child: ListTile(
        title: Text(usuarios.nome),
        subtitle: Text(usuarios.email),
        // ignore: sized_box_for_whitespace
        trailing: PopupMenuButton<int>(
          onSelected: (item) => onSelected(context, item),
          itemBuilder: (context) => [
            PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: const [
                    Icon(Icons.visibility),
                    Text('   Visualizar')
                  ],
                )),
            PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: const [Icon(Icons.edit), Text('   Editar')],
                )),
            PopupMenuItem<int>(
                value: 2,
                child: Row(
                  children: const [Icon(Icons.delete), Text('   Deletar')],
                )),
          ],
        ),
      ),
    );
  }
}
