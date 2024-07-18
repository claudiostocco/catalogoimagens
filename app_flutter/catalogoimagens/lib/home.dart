import 'package:catalogoimagens/meu_teste.dart';
import 'package:catalogoimagens/teste_exemplo.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/meu_teste',
      routes: {
        '/meu_teste': (context) => const MeuTeste(),
        '/teste_exemplo': (context) => const TesteExemplo(),
      },
    );
  }
}
