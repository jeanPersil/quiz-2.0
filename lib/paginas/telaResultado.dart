import 'package:flutter/material.dart';
import 'package:quiz/paginas/telaQuizz.dart';
import 'package:quiz/widgets/TelaResultado_VoltarInicio.dart';
import 'package:quiz/widgets/TelaResultado_graficoPizza.dart';

class Telaresultado extends StatelessWidget {
  Telaresultado({super.key, required this.acertos, required this.erros});

  double acertos;
  double erros;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: const [VoltarInicio()],
      ),
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                "assets/imagens/trofe.jpg",
                height: 350,
                width: 350,
              ),
              const SizedBox(height: 20),
              const Text(
                "Parabéns, você concluiu o Quiz!!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Flexible(child: GraficoPizza(acertos: acertos, erros: erros)),
              Text(
                'Acertos: $acertos | Erros: $erros',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Telaquiz()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                  child: const Text(
                    "JOGAR NOVAMENTE",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      fontSize: 16,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
