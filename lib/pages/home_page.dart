

import 'package:flutter/material.dart';
import 'package:todoapp/Utilities/dialog_box.dart';
import 'package:todoapp/Utilities/todo_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List toDoList = [
    ["Make money",false],
    ["Make money",false],
  ];



  // text controller

  final _controller = TextEditingController();

    //list of to do task



    void checkBoxChanged (bool? value, int index){
      setState(() {
       toDoList[index][1] = !toDoList[index][1];
      });

       
    }

    //save new task

    void saveNewTask(){
      setState(() {
       toDoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();

    }

    void createNewTask(){
    showDialog(context: context, builder:(context){
      return DialogBox(
        controller: _controller,
        onCancel: ()=> Navigator.of(context).pop(),
        onSave: saveNewTask,
      );
    } );
    }

    void deleteTask(int index){
      setState(() {
        toDoList.removeAt(index);
      });
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 244, 228, 0),
        // elevation: 10,
        // shadowColor: Colors.black,
        centerTitle: true,
        title: Text("To Do"),
      ),

       floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 244, 228, 0),
        onPressed: createNewTask,
        child: Icon(Icons.add),
        shape: CircleBorder()
       ),

      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context,index){
          return TodoTile(
            taskName: toDoList[index][0],
             TaskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value,index),
              deleteFuntion:(context) => deleteTask(index),
               );
        }
      ),
    );
  }
}