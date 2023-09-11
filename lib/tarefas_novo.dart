import 'package:flutter/material.dart';
import 'package:tarefas/tarefas_form.dart';

import 'tarefa_state.dart';

class TarefasNovo extends StatelessWidget {
  final TarefaState state;
  const TarefasNovo({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Nova Tarefa"),
      ),
      body: TarefasForm(state: this.state),
    );
  }
}