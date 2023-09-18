import 'package:flutter/material.dart';
import 'package:hellooooo/widget/addlist.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  var buttonCheck = "Work";
  var category = ["Work", "Personal", "Shopping", "Health"];

  List<Data> workList = [];
  List<Data> workCheck = [];

  void onbuttonCheck(category) {
    setState(() {
      buttonCheck = category;
      workCheck =
          workList.where((element) => element.category == category).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(176, 218, 247, 1),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 50, left: 20),
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.blue,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 50, right: 20),
                child: Icon(
                  Icons.account_circle,
                  size: 30,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.blue),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Manage yor task \n Time well',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  FontAwesomeIcons.arrowUpRightDots,
                ),
                SizedBox(
                  width: 50,
                ),
                Icon(
                  FontAwesomeIcons.book,
                  size: 30,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Categories',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                categoryButton(
                    label: 'Work',
                    icon: Icons.work,
                    work: () {
                      onbuttonCheck("Work");
                    }),
                categoryButton(
                    label: 'Personal',
                    icon: Icons.person,
                    work: () {
                      onbuttonCheck("Personal");
                    }),
                categoryButton(
                    label: 'Shopping',
                    icon: Icons.shopping_basket,
                    work: () {
                      onbuttonCheck("Shopping");
                    }),
                categoryButton(
                    label: 'Health',
                    icon: Icons.health_and_safety,
                    work: () {
                      onbuttonCheck("Health");
                    }),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    'You have'
                    ' ${workCheck.length}  '
                    'task ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: workCheck.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 226, 236, 243),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: workCheck[index].isDone,
                        onChanged: (bool? value) {
                          setState(() {
                            workCheck[index].isDone = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          '${workCheck[index].task}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              workList.remove(workCheck[index]);
                              workCheck.remove(workCheck[index]);
                            });
                          },
                          icon: Icon(Icons.delete)),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SafeArea(
              child: FloatingActionButton(
            onPressed: () async {
              final res = await showModalBottomSheet(
                context: context,
                builder: (context) => addList(),
              );
              if (res != null)
                setState(() {
                  workList.add(
                      Data(task: res, isDone: false, category: buttonCheck));
                  workCheck = workList
                      .where((element) => element.category == buttonCheck)
                      .toList();
                });
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
          ))
        ],
      ),
    );
  }

  Widget categoryButton({
    required label,
    required IconData icon,
    required Function work,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            work();
          },
          child: Container(
            width: 70,
            height: 60,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ],
              color: buttonCheck == label ? Colors.blue : Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.black, size: 30),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(label),
      ],
    );
  }
}

class Data {
  late String task;
  late String category;
  late bool isDone = false;
  Data({required this.task, required this.isDone, required this.category});
}
