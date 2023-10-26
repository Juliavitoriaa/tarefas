import 'tarefa_model.dart';

abstract class TarefasHelper {
  Future<int> salvar(Tarefa tarefa);
  Future<Tarefa> obter(int id);
  Future<List<Tarefa>> listar();
  Future<void> delete(Tarefa tarefa);
}