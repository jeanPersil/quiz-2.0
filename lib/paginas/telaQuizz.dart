import 'package:flutter/material.dart';
import 'package:quiz/models/modeloQuestoes.dart';
import 'package:quiz/widgets/questoes_widgets.dart';
import 'package:quiz/widgets/botaoNext.dart';
import 'package:quiz/widgets/opcoes.dart';

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
  bool foiPressionado = false;

  void proximaQuestao() {
    if (indexQuestao == questoes.length - 1) {
      return;
    } else {
      if (foiPressionado) {
        setState(() {
          indexQuestao++;
          foiPressionado = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text("Por favor, selecione uma das opcoes acima")));
      }
    }
  }

  void escolher_cor() {
    setState(() {
      foiPressionado = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: const Text('Quizz'),
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
            ),
            const SizedBox(height: 25),
            for (int i = 0; i < questoes[indexQuestao].opcoes.length; i++)
              Card_de_opcoes(
                  opcao: questoes[indexQuestao].opcoes.keys.toList()[i],
                  cor: foiPressionado
                      ? questoes[indexQuestao].opcoes.values.toList()[i] == true
                          ? Colors.green
                          : Colors.red
                      : Colors.white,
                  botaoPressionado: escolher_cor),
          ],
        ),
      ),
      //floatingActionButton: Botaonext(proximaQuestao: proximaQuestao),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: proximaQuestao,
          icon: const Icon(
            Icons.arrow_circle_right_sharp,
            color: Colors.white,
          ),
          backgroundColor: Colors.deepPurple,
          label: const Text(
            "PROXIMA QUESTÃO",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
                color: Colors.white),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
