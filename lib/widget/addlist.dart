import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hellooooo/screen/todolist.dart';

class addList extends StatefulWidget {
  const addList({super.key});

  @override
  State<addList> createState() => _addListState();
}

class _addListState extends State<addList> {
  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Add a task',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Task',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.all(10),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter task',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, taskController.text);
              },
              child: Text('Add Task'),
            ),
          ),
        ),
      ],
    ));
  }
}
