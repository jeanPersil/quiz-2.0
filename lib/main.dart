import 'package:flutter/material.dart';
import 'package:quiz/paginas/telaResultado.dart';
import 'package:quiz/paginas/tela_inicial.dart';

void main() => runApp(const Myapp());

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TelaInicial(),
      debugShowCheckedModeBanner: false,
    );
  }
}
