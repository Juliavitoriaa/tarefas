import 'package:flutter/material.dart';
import 'package:tarefas/tarefas_helper.dart';
import 'package:tarefas/tarefas_list.dart';

import 'tarefa_state.dart';

class TarefasPage extends StatelessWidget {
  final TarefasHelper helper;
  const TarefasPage({super.key, required this.helper});

  @override
  Widget build(BuildContext context) {
    TarefaState state = TarefaState();
    state.carregando.value = true;
    helper.listar().then((lista){ 
      state.listaTarefas = lista; 
      state.carregando.value = false;
    });

    return Scaffold(
      appBar: AppBar(title: Text("Tarefas"),),
      body: ValueListenableBuilder(
        valueListenable: state.carregando,
         builder: (constext, value, child) =>
         value?
            Center(
              child: CircularProgressIndicator(valueColor: 
                 AlwaysStoppedAnimation(Colors.blue),),
             ):
         state.listaTarefas.isEmpty?listaVazia():
         TarefasList(tarefas: state.listaTarefas),),
      floatingActionButton: 
        FloatingActionButton(onPressed: (){
          Navigator.of(context).pushNamed("/add");
        }, child: Icon(Icons.add)),
    );
  }
  
  listaVazia() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset("imagens/lista.png"),

            ),
            Text("Lista de tarefas vazia!", style: TextStyle(fontSize: 24),)
          ],
        ),
      ],
    );
  }
}