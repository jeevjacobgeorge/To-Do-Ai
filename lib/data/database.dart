  import 'package:hive/hive.dart';

class ToDoDataBase {
    //referenc box
    List todolist = [];
    final _taskBox = Hive.box('taskBox');

    //run this method if its the first time user is using the app
    void createInitialData(){
      todolist = [
        ["Exercise", false,''],
        ["Buy Milk", false,''],
      ];
    }
  //load the database
  void loadData(){
    todolist = _taskBox.get("TODOLIST");
    for (int i = 0; i < todolist.length;i++){
      todolist[i][2] = '';
    };
  }
  //update the database
  void updateData(){
    _taskBox.put("TODOLIST",todolist);
  }
}