part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];

}

// ...........Class Add Task...............

 class  addTask extends TaskEvent {
  final String title;
  const addTask(this.title);
 }

 // ...........Class Remove Task...............

class  removeTask extends TaskEvent{
  final String id;
  const removeTask(this.id);
}


// ...........Class Toggle Task...............

class toggleTask extends TaskEvent{
  final String id;
 const toggleTask(this.id);
} 