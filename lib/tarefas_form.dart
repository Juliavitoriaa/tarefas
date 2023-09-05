import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'tarefa_model.dart';
import 'tarefa_state.dart';
import 'tarefas_helper.dart';

class TarefasForm extends StatefulWidget {
  final TarefaState state;
  const TarefasForm({super.key, required this.state});

  @override
  State<TarefasForm> createState() => _TarefasFormState();
}

class _TarefasFormState extends State<TarefasForm> {
  final _dateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _tarefa = Tarefa(descricao: "", prazo: DateTime.now());
  late TarefasHelper helper;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8, vertical: 10),
      child: Form(

        key: _formKey,

        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text("Descrição"), border: UnderlineInputBorder()),
              validator: (value) => (value??"").isEmpty?"Uma descrição para a tarefa deve ser informada.":null,  // 4- Validador do campo descrição
              onSaved: (value)=>_tarefa.descricao = value!,  
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: _dateController, // controlador associado
              readOnly: true,
              onTap: () async {
              var data = await showDatePicker(context: context, 
               
               initialDate: DateTime.now(),
               firstDate: DateTime.now(),
               lastDate: DateTime.now().add(Duration(days: 365)),);
                print(data);
                if (data!=null) {
                  String dataFormatada = DateFormat("dd/MM/yyyy").format(data);
                  _dateController.text = dataFormatada;
                }
              },
              
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                  label: Text("Prazo"), border: UnderlineInputBorder()),
              validator: (value){
                try {
                  DateTime data = DateFormat("dd/MM/yyyy").parse(value!);
                  if (data.isBefore(DateTime.now())){
                     return "Data não pode ser no passado!";
                  } 
                } catch(e){
                return "Data inválida";
                }
              },
              onSaved: (value) => _tarefa.prazo = DateFormat("dd/MM/yyyy").parse(value!),
              ),
           const SizedBox(height: 10,),
           ElevatedButton(onPressed: () async {

            _formKey.currentState!.deactivate();
            if (_formKey.currentState!.validate()){
             _formKey.currentState!.save();
            print("Tarefa digitada: $_tarefa");

            await helper.salvar();
          
            }
           }, child: Text("Salvar"))
          ],
        ),
      ),
    );
  }
}