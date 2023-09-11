import 'package:flutter_test/flutter_test.dart';
import 'package:tarefas/tarefa_model.dart';
import 'package:tarefas/tarefas_helper.dart';
import 'package:tarefas/tarefas_helper_impl.dart';

void main() {
  LiveTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('tarefas helper ...', (tester) async {

    var tarefa = Tarefa(descricao: "Tarefa de Teste", prazo: DateTime.now().add(Duration(days: 30)));

    TarefasHelper helper = TarefasHelperImpl();
    int id = await helper.salvar(tarefa);
    print("Tarefa incluída com o id $id");

  });
}