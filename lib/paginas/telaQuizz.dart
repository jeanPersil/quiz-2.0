import 'package:flutter/material.dart';
import 'package:quiz/models/modeloQuestoes.dart';
import 'package:quiz/widgets/questoes_widgets.dart';
import 'package:quiz/widgets/botaoNext.dart';

class Telaquiz extends StatefulWidget {
  @override
  _TelaquizState createState() => _TelaquizState();
}

class _TelaquizState extends State<Telaquiz> {
  List<Questoes> questoes = [
    Questoes(id: '1', titulo: 'Quanto é 10 + 10', opcoes: {
      '10': true,
      '5': false,
      '2': false,
      '0': false,
    }),
    Questoes(id: '2', titulo: 'Quanto é 15 + 10', opcoes: {
      '10': false,
      '25': true,
      '2': false,
      '0': false,
    }),
    Questoes(id: '3', titulo: 'Quanto é 10 + 1', opcoes: {
      '11': true,
      '5': false,
      '2': false,
      '0': false,
    })
  ];

  int indexQuestao = 0;

  void proximaQuestao() {
    if (indexQuestao == questoes.length - 1) {
      return;
    } else {
      setState(() {
        indexQuestao++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('Quizz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            QuestoesWidgets(
                index: indexQuestao,
                questao: questoes[indexQuestao].titulo,
                questoesTotal: questoes.length),
            const Divider(
              color: Colors.white,
            )
          ],
        ),
      ),
      floatingActionButton: Botaonext(proximaQuestao: proximaQuestao),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
