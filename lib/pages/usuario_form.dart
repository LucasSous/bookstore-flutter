// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:livraria_mobile/models/model_usuarios.dart';
import 'package:livraria_mobile/provider/usuarios_provider.dart';
import 'package:provider/provider.dart';

class UsuarioForm extends StatefulWidget {
  const UsuarioForm({Key? key}) : super(key: key);

  @override
  _UsuarioFormState createState() => _UsuarioFormState();
}

class _UsuarioFormState extends State<UsuarioForm> {
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
        final usuarios = arg as Usuarios;
        _formData['id'] = usuarios.id;
        _formData['nome'] = usuarios.nome;
        _formData['endereco'] = usuarios.endereco;
        _formData['cidade'] = usuarios.cidade;
        _formData['email'] = usuarios.email;
      }
    }
  }

  titulo() {
    if (_formData['id'] != null) {
      return Text('Editar Usuário');
    } else {
      return Text('Novo Usuário');
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
                        initialValue: _formData['endereco'],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Este campo não pode ser nulo';
                          }
                          if (text.length < 3) {
                            return 'O mínimo de caracteres é 3';
                          }
                          if (text.length > 50) {
                            return 'O máximo de caracteres é 50';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Endereço*',
                          hintText: 'Informe um endereço',
                          suffixIcon: Icon(Icons.location_city),
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) => _formData['endereco'] = value!,
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
                        height: 15,
                      ),
                      TextFormField(
                        initialValue: _formData['email'],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Este campo não pode ser nulo';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'E-mail*',
                            hintText: 'Informe um email',
                            suffixIcon: Icon(Icons.email),
                            border: OutlineInputBorder()),
                        onSaved: (value) => _formData['email'] = value!,
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
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();

                                if (_formData['id'] != null) {
                                  Provider.of<UsuariosProvider>(context,
                                          listen: false)
                                      .update(Usuarios(
                                          id: _formData['id'],
                                          nome: _formData['nome'],
                                          endereco: _formData['endereco'],
                                          cidade: _formData['cidade'],
                                          email: _formData['email']));
                                } else {
                                  Provider.of<UsuariosProvider>(context,
                                          listen: false)
                                      .save(Usuarios(
                                          nome: _formData['nome'],
                                          endereco: _formData['endereco'],
                                          cidade: _formData['cidade'],
                                          email: _formData['email']));
                                }
                                Navigator.of(context).pop();
                              }
                            },
                            icon: Icon(Icons.save),
                            label: Text('Salvar')),
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
