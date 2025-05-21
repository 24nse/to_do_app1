import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:to_do_app1/models/task_model.dart';
import 'package:uuid/uuid.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<TaskEvent>((event, emit) {
    });
      on<addTask>(_addTask);
      on<removeTask>(_removeTask);
      on<toggleTask>(_toggleTask);
  }





//.................................................................




// .....................Add Task ........................

  FutureOr<void> _addTask(addTask event, Emitter<TaskState> emit) {
    (event,emit){
        final model=TaskModel(id: Uuid().v4(), title: event.title, isCompleted: false);
        emit(UpdateTask([...state.tasksList,model]));

      };
  }


// .....................Remove Task ........................

  FutureOr<void> _removeTask(removeTask event, Emitter<TaskState> emit) {
    (event, emit){
     final   List<TaskModel> newList=state.tasksList.where((task)=>task.id != event.id).toList();
        emit(UpdateTask(newList));
      };
  }



  // .....................Toggle Task ........................


  FutureOr<void> _toggleTask(toggleTask event, Emitter<TaskState> emit) {
    (event,emit){
        final List<TaskModel> newList=state.tasksList.map((task){
          return task.id==event.id?task.copyWith(isCompleted:!task.isCompleted):task;
        }).toList();
        emit(UpdateTask(newList));
      };
  }
}

