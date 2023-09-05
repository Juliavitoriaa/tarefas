import 'package:sembast/sembast.dart';
import 'package:tarefas/sembast_database.dart';

import 'tarefas_helper.dart';
import 'tarefa_model.dart';

class TarefasHelperImpl extends TarefasHelper{
  @override
  excluir() {
    // TODO: implement excluir
    throw UnimplementedError();
  }

  @override
  listar() {
    // TODO: implement listar
    throw UnimplementedError();
  }

  @override
  obter() {
    // TODO: implement obter
    throw UnimplementedError();
  }

  @override
  salvar(Tarefa tarefa) async {
    var store = intMapStoreFactory.store('tarefas');
    var db = SembastDatabase().getInstance();
    await store.add(db,tarefa.getMap());
  }

}
