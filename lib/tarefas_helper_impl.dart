import 'package:sembast/sembast.dart';
import 'package:tarefas/sembast_database.dart';

import 'tarefa_model.dart';
import 'tarefas_helper.dart';

class TarefasHelperImpl extends TarefasHelper {
  @override
  Future<void> excluir(int id) async {
    var store = intMapStoreFactory.store('tarefas');
    var db = (await SembastDatabase().getInstance());
    await store.delete(db, finder: Finder(filter: Filter.byKey(id)));
  }

  @override
  Future<List<Tarefa>> listar() async {
    var store = intMapStoreFactory.store('tarefas');
    var db = (await SembastDatabase().getInstance());
    var snapshot = await store.find(db);
    return snapshot
        .map((e) => Tarefa.fromJson(id: e.key, value: e.value))
        .toList();
  }

  @override
  Future<Tarefa> obter(int id) async {
    var store = intMapStoreFactory.store('tarefas');
    var db = (await SembastDatabase().getInstance());
    var record = await store.record(id).get(db);
    if (record == null) throw "Registro $id não encontrado.";
    return Tarefa.fromJson(id: id, value: record);
  }

  @override
  Future<int> salvar(Tarefa tarefa) async {
    var store = intMapStoreFactory.store('tarefas');
    var db = (await SembastDatabase().getInstance());
    return await store.add(db, tarefa.getMap());
  }
}