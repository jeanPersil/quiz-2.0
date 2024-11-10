import 'package:flutter/material.dart';

class BarradeProgressao extends StatelessWidget {
  BarradeProgressao(
      {super.key, required this.posicaoQuestao, required this.tamanhoLista});

  int posicaoQuestao;
  int tamanhoLista;

  @override
  Widget build(BuildContext context) {
    double progresso = (posicaoQuestao) / tamanhoLista;
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Card(
        child: LinearProgressIndicator(
          value: progresso,
        ),
      ),
    );
  }
}
