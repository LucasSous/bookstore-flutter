// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:livraria_mobile/models/model_livros.dart';
import 'package:livraria_mobile/routes/app_rounts.dart';

class LivrosList extends StatelessWidget {
  final Livros livros;
  const LivrosList(this.livros);

  @override
  Widget build(BuildContext context) {
    void onSelected(BuildContext context, int item) {
      switch (item) {
        // case 0:
        //   _visualizarModal();
        //  break;
        case 1:
          Navigator.of(context)
              .pushNamed(AppRoutes.PUBLISHER_FORM, arguments: livros);
          break;
        case 2:
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (ctx) => AlertDialog(
                    title: const Text('Excluir Livro'),
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
                          //Provider.of<EditorasProvider>(context, listen: false)
                          //  .remove(Editoras(
                          // id: livros.id,
                          // nome: livros.nome,
                          // ));
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
            spreadRadius: 0.1,
            blurRadius: 4,
            color: Colors.black26,
          )
        ],
      ),
      child: ExpansionTile(
        title: Text(livros.nome),
        subtitle: Text(livros.autor),

        // ignore: sized_box_for_whitespace
        trailing: Container(
          width: 80,
          child: Row(
            children: [
              const Icon(Icons.expand_more),
              PopupMenuButton<int>(
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
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
            height: 65,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Código: ${livros.id}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Editora: ${livros.editora}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Lancamento: ${livros.lancamento}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Quantidade: ${livros.quantidade}',
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
