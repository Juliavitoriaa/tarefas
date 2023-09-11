import 'package:flutter_test/flutter_test.dart';
import 'package:tarefas/tarefa_model.dart';
import 'package:tarefas/tarefas_helper_impl.dart';

void main() {
  LiveTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('tarefas helper ...', (tester) async {
    var tarefa = Tarefa(
        descricao: "Teste", prazo: DateTime.now().add(Duration(days: 30)));
    var helper = TarefasHelperImpl();
    try {
      var salvo = await helper.salvar(tarefa);
      expect(salvo, isNonZero);
    } catch (e) {
      print(e);
    }
  });

  testWidgets('tarefas helper: listar', (tester) async {
    var helper = TarefasHelperImpl();
    try {
      var lista = await helper.listar();
      print(lista);
      expect(lista, isNotEmpty);
    } catch (e) {
      print(e);
    }
  });

  testWidgets('tarefas helper: obter', (tester) async {
    var helper = TarefasHelperImpl();
    try {
      var tarefa = await helper.obter(1);
      print(tarefa);
      expect(tarefa.id, equals(1));
    } catch (e) {
      print(e);
    }
  });

  testWidgets('tarefas helper: excluir', (tester) async {
    var helper = TarefasHelperImpl();
    try {
      await helper.excluir(1);
      var tarefa = await helper.obter(1);
      print(tarefa);
      expect(tarefa, isNull);
    } catch (e) {
      print(e);
    }
  });
}