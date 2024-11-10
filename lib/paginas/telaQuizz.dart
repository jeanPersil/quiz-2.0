import 'package:flutter/material.dart';
import 'package:quiz/models/modeloQuestoes.dart';
import 'package:quiz/paginas/telaResultado.dart';
import 'package:quiz/widgets/TelaQuiz_barraProgressao.dart';
import 'package:quiz/widgets/TelaQuiz_questoes_widgets.dart';

class Telaquiz extends StatefulWidget {
  @override
  _TelaquizState createState() => _TelaquizState();
}

class _TelaquizState extends State<Telaquiz> {
  List<Questoes> questoes = [
    Questoes(titulo: 'Quem é o ultimo boss de dark souls 3?', opcoes: {
      'Lotric': false,
      'Vordit': false,
      'Soul of Sinder': true,
      'Gael': false,
    }),
    Questoes(
        titulo:
            'Qual é a maneira correta de declara uma variavel do tipo INTEIRA no flutter?',
        opcoes: {
          'int variavel': true,
          'Int variavel': false,
          'var variavel': false,
          'String varivael': false,
        }),
    Questoes(titulo: 'Qual é a capital do brasil?', opcoes: {
      'Salvador': false,
      'Pernambuco': false,
      'Brasilia': true,
      'Estados Unidos': false,
    }),
    Questoes(titulo: 'Qual foi o ano da ultima copa do mundo? ', opcoes: {
      '2022': true,
      '2018': false,
      '2014': false,
      '2020': false,
    }),
    Questoes(
        titulo:
            'A pessoa que usa tema CLARO no Vscode / discord é deveria estar em um Hospicio.',
        opcoes: {
          'VERDADEIRO': true,
          'FALSO': false,
        })
  ];

  int indexQuestao = 0;
  double pontuacao = 0;
  double erros = 0;
  bool foiPressionado = false;

  void proximaQuestao() {
    if (indexQuestao == questoes.length - 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Telaresultado(acertos: pontuacao, erros: erros)),
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
        title: const Text('Quiz'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Acertos: ${pontuacao.toInt()}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: BarradeProgressao(
                  posicaoQuestao: indexQuestao + 1,
                  tamanhoLista: questoes.length),
            ),
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
                          } else {
                            erros++;
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
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
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
