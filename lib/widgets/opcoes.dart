import 'package:flutter/material.dart';

class Card_de_opcoes extends StatelessWidget {
  const Card_de_opcoes(
      {super.key,
      required this.opcao,
      required this.cor,
      required this.botaoPressionado});

  final String opcao;
  final Color cor;
  final VoidCallback botaoPressionado;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: botaoPressionado,
      child: Card(
        color: cor,
        child: ListTile(
          title: Text(
            opcao,
            style: TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
