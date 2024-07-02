// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import "package:hive/hive.dart";
import "package:to_do_app/data/database.dart";
import "package:to_do_app/util/dialog_box.dart";
import "package:to_do_app/util/todotile.dart";
import 'package:to_do_app/util/gemini.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _taskBox = Hive.box('taskBox');
  ToDoDataBase db = ToDoDataBase();
  final GeminiService _geminiService = GeminiService();

  @override
  void initState() {
    super.initState();
    // First time user opens the app
    if (_taskBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      // There already exists data
      db.loadData();
    }
  }

  final _controller = TextEditingController();

  // Check box was tapped
  void CheckBoxChanged(bool? value, int index) {
    setState(() {
      db.todolist[index][1] = value;
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.todolist.add([_controller.text, false, '']);
      _controller.clear();
    });
    db.updateData();
    Navigator.of(context).pop();
  }

void getHelpNote(int index, String taskName) async {
  try {
    setState(() {
      db.todolist[index][2] = 'Hmm let me think😌....';
    });
    final helpNote_response = await _geminiService.getHelpNoteForTask(taskName);
    // Clear previous help note
    setState(() {
      db.todolist[index][2] = '';
    });

    // Simulate typewriter effect
    for (int i = 0; i < helpNote_response.length; i++) {
      await Future.delayed(Duration(milliseconds: 5)); // Adjust delay time as needed
      setState(() {
        db.todolist[index][2] += helpNote_response[i];
      });
    }
  } catch (e) {
    setState(() {
      db.todolist[index][2] = 'Error: ${e.toString()}';
    });
  }
}


  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(child: Text('TO DO')),
        backgroundColor: Color.fromARGB(235, 236, 213, 11),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.yellow[200],
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: db.todolist.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  taskName: db.todolist[index][0],
                  taskCompleted: db.todolist[index][1],
                  onChanged: (value) => CheckBoxChanged(value, index),
                  deleteFunction: (context) => deleteTask(index),
                  helpNote: db.todolist[index][2],
                  getHelpNote: (context) => getHelpNote(index, db.todolist[index][0]),
                  
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
