import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'tarefa_model.dart';

class TarefasList extends StatelessWidget {
  final List<Tarefa> tarefas;
  const TarefasList({super.key, required this.tarefas});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tarefas.length,
      itemBuilder: (context, index) => 
      ListTile(
        onTap: () {

          Navigator.of(context).pushNamed("/edit",arguments:tarefas[index]);
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

