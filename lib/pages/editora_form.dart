// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:livraria_mobile/models/model_editoras.dart';
import 'package:livraria_mobile/provider/editoras_provider.dart';
import 'package:provider/provider.dart';

class EditoraForm extends StatefulWidget {
  const EditoraForm({Key? key}) : super(key: key);

  @override
  _EditoraFormState createState() => _EditoraFormState();
}

class _EditoraFormState extends State<EditoraForm> {
  final formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  late final String? Function(String? text)? validator;
  late final void Function(String? text)? onSaved;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;

      if (arg != null) {
        final usuarios = arg as Editoras;
        _formData['id'] = usuarios.id;
        _formData['nome'] = usuarios.nome;
        _formData['cidade'] = usuarios.cidade;
      }
    }
  }

  titulo() {
    if (_formData['id'] != null) {
      return Text(
        'Editar Editora',
        style: TextStyle(color: Color(0xFFBDBDBD)),
      );
    } else {
      return Text(
        'Nova Editora',
        style: TextStyle(color: Color(0xFFBDBDBD)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: titulo(),
          elevation: 0,
          backgroundColor: const Color(0xff212529),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xff212529),
          ),
          child: Form(
              key: formKey,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36))),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                      ),
                      TextFormField(
                        initialValue: _formData['nome'],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Este campo não pode ser nulo';
                          }
                          if (text.length < 3) {
                            return 'O mínimo de caracteres é 3';
                          }
                          if (text.length > 30) {
                            return 'O máximo de caracteres é 30';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Nome*',
                          hintText: 'Informe um nome',
                          suffixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) => _formData['nome'] = value!,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        initialValue: _formData['cidade'],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Este campo não pode ser nulo';
                          }
                          if (text.length < 3) {
                            return 'O mínimo de caracteres é 3';
                          }
                          if (text.length > 20) {
                            return 'O máximo de caracteres é 20';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Cidade*',
                            hintText: 'Informe uma cidade',
                            suffixIcon: Icon(Icons.location_city),
                            border: OutlineInputBorder()),
                        onSaved: (value) => _formData['cidade'] = value!,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();

                                if (_formData['id'] != null) {
                                  Provider.of<EditorasProvider>(context,
                                          listen: false)
                                      .update(Editoras(
                                    id: _formData['id'],
                                    nome: _formData['nome'],
                                    cidade: _formData['cidade'],
                                  ));
                                } else {
                                  Provider.of<EditorasProvider>(context,
                                          listen: false)
                                      .save(Editoras(
                                    nome: _formData['nome'],
                                    cidade: _formData['cidade'],
                                  ));
                                }
                                Navigator.of(context).pop();
                              }
                            },
                            icon: Icon(Icons.save),
                            label: Text(
                              'Salvar',
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
