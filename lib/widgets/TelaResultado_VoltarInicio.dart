import 'package:flutter/material.dart';
import 'package:quiz/paginas/tela_inicial.dart';

class VoltarInicio extends StatelessWidget {
  const VoltarInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TelaInicial()));
        },
        icon: const Icon(Icons.home));
  }
}
