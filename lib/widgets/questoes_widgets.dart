import 'package:flutter/material.dart';

class QuestoesWidgets extends StatelessWidget {
  const QuestoesWidgets(
      {super.key,
      required this.index,
      required this.questao,
      required this.questoesTotal});

  final String questao;
  final int index;
  final int questoesTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Questao ${index + 1} / $questoesTotal: $questao',
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}
