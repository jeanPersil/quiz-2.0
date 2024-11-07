import 'package:flutter/material.dart';
import 'package:quiz/paginas/telaQuizz.dart';

class Botaonext extends StatelessWidget {
  const Botaonext({super.key, required this.proximaQuestao});

  final VoidCallback proximaQuestao;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: proximaQuestao,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(vertical: 12),
        child: const Text(
          'Proxima Questao',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
