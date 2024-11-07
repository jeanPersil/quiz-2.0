import 'package:flutter/material.dart';

class Card_de_opcoes_teste extends StatefulWidget {
  Card_de_opcoes_teste(
      {super.key,
      required this.opcao,
      required this.respostaCorreta,
      required this.pontuacao});

  final String opcao;
  final bool respostaCorreta;
  int pontuacao = 0;

  @override
  State<Card_de_opcoes_teste> createState() => _Card_de_opcoes_testeState();
}

class _Card_de_opcoes_testeState extends State<Card_de_opcoes_teste> {
  bool clicado = false;
  

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: TextButton(
            onPressed: () {
              setState(() {
                clicado = true;
              });
            },
            style: TextButton.styleFrom(
                backgroundColor: clicado
                    ? (widget.respostaCorreta ? Colors.green : Colors.red)
                    : Colors.white),
            child: (Text(widget.opcao))),
      ),
    );
  }
}
