import 'package:flutter/material.dart';

class Card_de_opcoes extends StatelessWidget {
  const Card_de_opcoes({super.key, required this.opcao, required this.verificarResposta});

  final String opcao;
  final bool verificarResposta;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: TextButton(onPressed: (){}, child: Text("resposta")),
      ),
    );
  }
}
