// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:livraria_mobile/models/model_usuarios.dart';
import 'package:livraria_mobile/provider/usuarios_provider.dart';
import 'package:livraria_mobile/routes/app_rounts.dart';
import 'package:provider/provider.dart';

class UsuariosList extends StatelessWidget {
  final Usuarios usuarios;
  const UsuariosList(this.usuarios);

  @override
  Widget build(BuildContext context) {
    //void _visualizarModal() {
    // showBarModalBottomSheet(
    //    context: context,
    //    builder: (context) => VisualizarModal(
    //          usuario: usuarios,
    //        ));
    // }

    void onSelected(BuildContext context, int item) {
      switch (item) {
        // case 0:
        //   _visualizarModal();
        //  break;
        case 1:
          Navigator.of(context)
              .pushNamed(AppRoutes.USER_FORM, arguments: usuarios);
          break;
        case 2:
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (ctx) => AlertDialog(
                    title: const Text('Excluir Usuário'),
                    content: const Text('Deseja realmente excluir?'),
                    actions: [
                      TextButton(
                        style: TextButton.styleFrom(),
                        onPressed: () {
                          Navigator.pop(ctx);
                        },
                        child: const Text(
                          'Não',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(),
                        onPressed: () {
                          Provider.of<UsuariosProvider>(context, listen: false)
                              .remove(Usuarios(
                                  id: usuarios.id,
                                  nome: usuarios.nome,
                                  endereco: usuarios.endereco,
                                  cidade: usuarios.cidade,
                                  email: usuarios.email));
                          Navigator.pop(ctx);
                        },
                        child: const Text('Sim'),
                      ),
                    ],
                  ));
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
            topRight: Radius.circular(5)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xFFBDBDBD),
            blurRadius: 2.0,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: ExpansionTile(
        title: Text(usuarios.nome),
        subtitle: Text(usuarios.email),

        // ignore: sized_box_for_whitespace
        trailing: Container(
          width: 70,
          child: Row(
            children: [
              const Icon(Icons.expand_more),
              PopupMenuButton<int>(
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  // PopupMenuItem<int>(
                  //  value: 0,
                  // child: Row(
                  //   children: const [
                  //    Icon(Icons.visibility),
                  //    Text('   Visualizar')
                  //  ],
                  // )),
                  PopupMenuItem<int>(
                      value: 1,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                          Text(
                            '   Editar',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      )),
                  PopupMenuItem<int>(
                      value: 2,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          Text(
                            '   Deletar',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Código: ${usuarios.id}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  usuarios.endereco,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  usuarios.cidade,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
