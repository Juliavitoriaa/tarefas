import 'package:flutter/widgets.dart';

import 'tarefa_model.dart';

class TarefaState {
  ValueNotifier<bool> carregando = ValueNotifier(false);
  List<Tarefa> listaTarefas = [];
  Tarefa? tarefa;
}