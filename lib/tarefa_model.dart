class Tarefa{
  String? id;
  String descricao;
  DateTime prazo;
  DateTime? concluido;


  Tarefa({this.id,required this.descricao,required this.prazo, this.concluido});

  @override
  String toString() {
    
    return "id:$id-descricao: $descricao -prazo: $prazo -concluido: $concluido";
  }

  Map<String, Object?> getMap() {
    return { "id": this.id,
             "descricao":this.descricao,
             "prazo":this.prazo,
             "concluido":this.concluido};
  }

}