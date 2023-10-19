import 'package:flutter/material.dart';
import 'package:tarefas/tarefa_state.dart';
import 'package:tarefas/tarefas_list.dart';


class TarefasPage extends StatelessWidget {
  final TarefaState state;  
  const TarefasPage({super.key, required this.state});
  
  @override
  Widget build(BuildContext context) {
    state.carregarLista();
    
    return Scaffold(
      appBar: AppBar(title: Text("Tarefas"),),
      body: ValueListenableBuilder(
        valueListenable: state.carregando,
        builder: (context, value, child) => 
        // 1- sem dados (lista vazia, nao estada carregando)
        // 2- consultando lista vazia/3-lista recuperada
        value?
           Center(
             child: CircularProgressIndicator(valueColor: 
                AlwaysStoppedAnimation(Colors.blue),),
           ):
        state.listaTarefas.isEmpty?listaVazia():
        TarefasList(state: state),),
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