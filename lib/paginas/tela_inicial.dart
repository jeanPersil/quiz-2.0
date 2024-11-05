import 'package:flutter/material.dart';
import 'package:quiz/main.dart';
import 'package:quiz/paginas/telaQuizz.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top 10 quiz BR'),
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
          SizedBox(height: 15),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Telaquiz()),
                );
              },
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              child: Text(
                'COMEÇAR!',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ))
        ],
      )),
    );
  }
}
