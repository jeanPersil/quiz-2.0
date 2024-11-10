class Questoes {
  final String titulo;
  final Map<String, bool> opcoes;

  Questoes({required this.titulo, required this.opcoes});

  @override
  String toString() {
    return 'Questao ($titulo ,$opcoes)';
  }
}
