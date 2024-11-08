import 'package:flutter/material.dart';
import 'package:quiz/models/modeloQuestoes.dart';
import 'package:quiz/paginas/telaResultado.dart';
import 'package:quiz/widgets/questoes_widgets.dart';

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
  int pontuacao = 0;
  bool foiPressionado = false;

  void proximaQuestao() {
    if (indexQuestao == questoes.length - 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Telaresultado()),
      );
    } else {
      if (foiPressionado) {
        setState(() {
          indexQuestao++;
          foiPressionado = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Por favor, selecione uma das opcoes acima")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: const Text('Quizz'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Pontuação: $pontuacao",
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
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
              ListTile(
                  title: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (foiPressionado) {
                            return;
                          }
                          foiPressionado = true;
                          if (questoes[indexQuestao]
                                  .opcoes
                                  .values
                                  .toList()[i] ==
                              true) {
                            pontuacao++;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: foiPressionado
                              ? (questoes[indexQuestao]
                                      .opcoes
                                      .values
                                      .toList()[i]
                                  ? Colors.green
                                  : Colors.red)
                              : Colors.white),
                      child: Text(
                        questoes[indexQuestao].opcoes.keys.toList()[i],
                        style: const TextStyle(fontSize: 20),
                      )))
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
