import 'package:flutter/material.dart';
import 'package:tarefas/tarefa_state.dart';
import 'package:tarefas/tarefas_helper.dart';
import 'package:tarefas/tarefas_list.dart';

class TarefasPage extends StatelessWidget {
  final TarefasHelper helper;
  const TarefasPage({super.key, required this.helper});

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: AppBar(title: Text("Tarefas"),),
      body: FutureBuilder( 
         future: helper.listar(),
         builder: (constext, snapshot) =>
         !snapshot.hasData?
            Center(
              child: CircularProgressIndicator(valueColor: 
                 AlwaysStoppedAnimation(Colors.blue),),
             ):
         snapshot.data!.isEmpty?listaVazia():
         TarefasList(tarefas: snapshot.data!),),
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