import 'package:flutter/material.dart';
import 'package:quiz/paginas/telaQuizz.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 10 quiz BR'),
        centerTitle: true,
      ),
      backgroundColor: Colors.lightBlue,
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/imagens/cere.png',
            height: 350,
            width: 350,
          ),
          const SizedBox(height: 15),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Telaquiz()),
                );
              },
              style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: const Text(
                'COMEÇAR!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    color: Colors.white),
              ))
        ],
      )),
    );
  }
}
