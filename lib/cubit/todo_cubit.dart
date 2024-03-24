import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/model/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if(title.isEmpty)
      {
        addError('Title is Empty');
        return;
      }
    final todo = Todo(
      name: title,
      createdAt: DateTime.now(),
    );
    /// U can do both way

    // emit(List.from(state));
    // emit([...state]);
    emit([...state, todo]);
  }
  @override
  void onChange(Change<List<Todo>> change) {
    print('Change: $change');
    super.onChange(change);
  }
  @override
  void onError(Object error, StackTrace stackTrace) {

    print('Error: $error');
    super.onError(error, stackTrace);
  }
}
