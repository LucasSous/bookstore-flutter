import 'package:flutter/material.dart';
import 'package:livraria_mobile/pages/editora_form.dart';
import 'package:livraria_mobile/pages/editoras_page.dart';
import 'package:livraria_mobile/pages/home_page.dart';
import 'package:flutter/services.Dart';
import 'package:livraria_mobile/pages/usuario_form.dart';
import 'package:livraria_mobile/pages/usuarios_page.dart';
import 'package:livraria_mobile/provider/editoras_provider.dart';
import 'package:livraria_mobile/provider/livros_provider.dart';
import 'package:livraria_mobile/provider/usuarios_provider.dart';
import 'package:livraria_mobile/routes/app_rounts.dart';
import 'package:provider/provider.dart';
import 'package:asuka/asuka.dart' as asuka;

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xff212529),
    systemNavigationBarColor: Color(0xFFF5F5F5),
    statusBarIconBrightness: Brightness.light,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: asuka.builder,
      title: 'Livraria WDA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Livraria-WDA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => UsuariosProvider(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => EditorasProvider(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => LivrosProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Livraria-WDA',
          debugShowCheckedModeBanner: false,
          routes: {
            AppRoutes.HOME: (_) => const HomePage(),
            AppRoutes.USER_FORM: (_) => const UsuarioForm(),
            AppRoutes.USER_PAGE: (_) => const UsuariosPage(),
            AppRoutes.PUBLISHER_FORM: (_) => const EditoraForm(),
            AppRoutes.PUBLISHER_PAGE: (_) => const EditorasPage(),
          },
        ));
  }
}
