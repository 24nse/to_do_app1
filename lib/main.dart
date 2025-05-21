
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app1/cubits/bloc/task_bloc.dart';

void main() {
  
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});
  final TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => TaskBloc(),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            final  controllerCubit = context.read<TaskBloc>();
            return Column(
            
              children: [
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: controller,
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      
                      hintText: 'Enter a task'
                    ),
                  ),
                ),
                ElevatedButton(
                  
                  onPressed: (){
                    if(controller.text.isEmpty)return;
                    controllerCubit.add(addTask(controller.text));
                    controller.clear();

                  }, 
                  child: Text("Add")),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.tasksList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                        title: Text(state.tasksList[index].title),
                        leading: Checkbox(
                          value: state.tasksList[index].isCompleted,
                          onChanged: (value){
                           controllerCubit.add(toggleTask(state.tasksList[index].id));
                          }),
                          trailing: IconButton(
                            onPressed: (){
                           controllerCubit.add(removeTask(state.tasksList[index].id));
                            },
                            icon: Icon(Icons.delete)),
                      );
                      },
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
