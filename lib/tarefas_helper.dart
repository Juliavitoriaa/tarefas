import 'tarefa_model.dart';

abstract class TarefasHelper {
  Future<int> salvar(Tarefa tarefa);
  Future<void> excluir(int id);
  Future<Tarefa> obter(int id);
  Future<List<Tarefa>> listar();
}