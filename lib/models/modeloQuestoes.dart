class Questoes {
  final String id;
  final String titulo;
  final Map<String, bool> opcoes;

  Questoes({required this.id, required this.titulo, required this.opcoes});

  @override
  String toString() {
    return 'Questao ($id , $titulo ,$opcoes)';
  }
}
