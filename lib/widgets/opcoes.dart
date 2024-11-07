import 'package:flutter/material.dart';

class Card_de_opcoes extends StatelessWidget {
  const Card_de_opcoes({super.key, required this.opcao, required this.cor});

  final String opcao;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cor,
      child: ListTile(
        title: Text(
          opcao,
          style: TextStyle(fontSize: 22),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
