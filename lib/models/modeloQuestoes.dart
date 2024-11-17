class Questoes {
  final String titulo;
  final Map<String, bool> opcoes;
  final String imagemURL;

  Questoes(
      {required this.titulo, required this.opcoes, required this.imagemURL});

  @override
  String toString() {
    return 'Questao ($titulo ,$opcoes, $imagemURL)';
  }
}
