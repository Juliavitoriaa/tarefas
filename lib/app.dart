import 'package:flutter/material.dart';
import 'package:tarefas/tarefa_state.dart';
import 'package:tarefas/tarefas_novo.dart';
import 'package:tarefas/tarefas_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    TarefaState state = TarefaState();


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      initialRoute: "/",
      routes: {"/":(context)=>TarefasPage(state: state,),
               "/add":(context)=>TarefasNovo(state: state,)},
      
    );
  }
}