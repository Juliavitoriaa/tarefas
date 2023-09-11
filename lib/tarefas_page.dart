import 'package:flutter/material.dart';
import 'package:tarefas/tarefa_state.dart';

class TarefasPage extends StatelessWidget {
  final TarefaState state;
  const TarefasPage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(title: Text("Tarefas"),),
      body: state.listaTarefas.isEmpty?listaVazia():Container(),
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