import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:to_do_app1/models/task_model.dart';
import 'package:uuid/uuid.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  addTask(String title){
    final model =  TaskModel(id: Uuid().v4(), title:title, isCompleted: false);
    emit(UpdateTask([...state.tasksList, model]));
  }
  removeTask(String id){
   final List<TaskModel> newList =state.tasksList.where((task)=>task.id != id).toList();
   emit(UpdateTask(newList));
  }
  toggleTask(String id){
    final List<TaskModel> newList=state.tasksList.map((task){
      return task.id == id? task.copyWith(isCompleted:!task.isCompleted):task;
    }).toList();
    emit(UpdateTask(newList));
  }
}
