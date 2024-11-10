import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraficoPizza extends StatelessWidget {
  GraficoPizza({super.key, required this.acertos, required this.erros});

  double acertos;
  double erros;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      margin: const EdgeInsets.all(16),
      child: PieChart(PieChartData(sections: [
        PieChartSectionData(
            value: acertos,
            color: Colors.green,
            title: 'ACERTOS',
            titleStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
            borderSide: const BorderSide(width: 2)),
        PieChartSectionData(
            value: erros,
            color: Colors.red,
            title: 'ERROS',
            titleStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
            borderSide: const BorderSide(width: 2)),
      ])),
    );
  }
}
