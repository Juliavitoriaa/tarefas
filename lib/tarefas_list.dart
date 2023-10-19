import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tarefas/tarefa_state.dart';


class TarefasList extends StatelessWidget {
  final TarefaState state;
  const TarefasList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    var tarefas = state.listaTarefas;
    return ListView.builder(
      itemCount: tarefas.length,
      itemBuilder: (context, index) => 
      ListTile(
        onTap: () async {
          await Navigator.of(context).pushNamed("/edit",arguments:tarefas[index]);
          state.carregarLista();
        },
         subtitle: prazo(tarefas[index].prazo),
         title: Text(tarefas[index].descricao), 
         trailing: tarefas[index].concluido!=null?
           Icon(Icons.check):
           null,
      )
      
      ,);
  }
  
  prazo(DateTime prazo) {
    var formatoData = DateFormat("dd/MM/yy hh:mm");
    var prazoStr = formatoData.format(prazo);
    return SizedBox(
          width: 50,
          child: Text("Prazo: "+prazoStr, style: TextStyle(fontSize: 12)));

  }
}