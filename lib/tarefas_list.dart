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
      itemBuilder: (context, index) {
        ValueNotifier<bool> concluido = ValueNotifier(tarefas[index].concluido!=null);
        return ListTile(
        onTap: () async {
          await Navigator.of(context).pushNamed("/edit",arguments:tarefas[index]);
          state.carregarLista();
        },
         subtitle: prazo(tarefas[index].prazo),
         title: Text(tarefas[index].descricao), 
         trailing:

         ValueListenableBuilder(
            valueListenable:  concluido,
             builder: (context, value, Widget) {
               return Checkbox(value: value, onChanged: (value){
                   concluido.value = value!;
                   
                   var tarefa = tarefas[index];
                   tarefa.concluido = concluido.value?DateTime.now():null;
                   state.salvar(tarefa);
                   print("Concluído: ${concluido.value}");
               });
             }
          ),
      );
      }
      
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