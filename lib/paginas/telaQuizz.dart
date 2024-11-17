import 'dart:async';
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
    Questoes(
      titulo: 'Qual é o nome do filho do Kratos na mitologia Nordica',
      opcoes: {
        'Calliope': false,
        'Mimir': false,
        'Atreus': true,
        'Antonio': false,
      },
      imagemURL: 'assets/imagens/atreus.jpg',
    ),
    Questoes(
      titulo: 'Quem é o primeiro chefe em Dark Souls 3?',
      opcoes: {
        'Index Gundyr': true,
        'Campeão Gundyr': false,
        'Vordit': false,
        'Bolsonaro': false,
      },
      imagemURL: 'assets/imagens/gundyr.jpg',
    ),
    Questoes(
      titulo:
          ' Qual o nome do mob em que você tem que matar pra zerar o Minecraft? ',
      opcoes: {
        'Herobrine': false,
        'Enderdragon': true,
        'Creeper': false,
        'Enderman': false,
      },
      imagemURL: 'assets/imagens/herobrine.jpg',
    ),
    Questoes(
      titulo:
          'Em The Last of Us, qual é o personagem que é imune ao fungo Cordyceps?',
      opcoes: {
        'Joel': false,
        'leon kennedy': false,
        'Chris Redfield': false,
        'Ellie': true,
      },
      imagemURL: 'assets/imagens/thelast.jpg',
    ),
    Questoes(
      titulo: 'Quem é o Warwick na serie ARCANE?',
      opcoes: {
        'Vi': false,
        'Aatrox': false,
        'Wander': true,
        'Silco': false,
      },
      imagemURL: 'assets/imagens/warwick.jpg',
    ),
    Questoes(
        titulo:
            'Quem usa tema claro no VsCode / Discord definitivamente não é normal.',
        opcoes: {
          'VERDADEIRO': true,
          'FAlSO': false,
        },
        imagemURL: 'assets/imagens/csgo.jpg')
  ];

  int indexQuestao = 0;
  double pontuacao = 0;
  double erros = 0;
  bool botao_pressionado = false;

  void avancar() {
    if (indexQuestao == questoes.length - 1) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Telaresultado(acertos: pontuacao, erros: erros)),
      );
    } else {
      setState(() {
        indexQuestao++;
        botao_pressionado = false;
      });
    }
  }

  void verificar_resposta({required bool resposta_do_usuario}) {
    if (!botao_pressionado) {
      if (resposta_do_usuario) {
        setState(() {
          botao_pressionado = true;
          pontuacao++;
        });
      } else if (!resposta_do_usuario) {
        setState(() {
          botao_pressionado = true;
          erros++;
        });
      }
      Timer(const Duration(seconds: 2), () {
        avancar();
      });
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
            const SizedBox(height: 15),
            Image.asset(
              questoes[indexQuestao].imagemURL,
              height: 250,
              width: 800,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 15),
            const Divider(
              color: Colors.white,
            ),
            for (int i = 0; i < questoes[indexQuestao].opcoes.length; i++)
              Flexible(
                child: ListTile(
                    title: ElevatedButton(
                        onPressed: () => verificar_resposta(
                            resposta_do_usuario: questoes[indexQuestao]
                                .opcoes
                                .values
                                .toList()[i]),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: botao_pressionado
                                ? (questoes[indexQuestao]
                                        .opcoes
                                        .values
                                        .toList()[i]
                                    ? Colors.green
                                    : Colors.red)
                                : Colors.white),
                        child: Text(
                          questoes[indexQuestao].opcoes.keys.toList()[i],
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                        ))),
              )
          ],
        ),
      ),
    );
  }
}
