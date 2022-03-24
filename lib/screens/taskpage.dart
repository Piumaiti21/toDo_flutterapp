// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_flutter/database_helper.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/widgets.dart';

class Taskpage extends StatefulWidget {
  final Task? task;
  Taskpage({required this.task});

  @override
  State<Taskpage> createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  String? _taskTitle = "";
  @override
  void initState() {
    if (widget.task != null) {
      _taskTitle = widget.task!.title;
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 6.0,
                  ),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: duplicate_ignore
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Image(
                            image:
                                AssetImage("assets/images/back_arrow_icon.png"),
                          ),
                        ),
                      ),
                      Expanded(
                          child: TextField(
                        onSubmitted: (value) async {
                          print("field Value: $value ");
                          if (value != "") {
                            if (widget.task == null) {
                              DatabaseHelper _dbHelper = DatabaseHelper();
                              Task _newTask = Task(title: value);

                              await _dbHelper.insertTask(_newTask);
                            } else {
                              print("Update the task");
                            }
                          }
                        },
                        controller: TextEditingController()..text = _taskTitle!,
                        decoration: InputDecoration(
                          hintText: "Enter Task Title",
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF211551),
                        ),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 12.0,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter Description for the task",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        )),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 20.0,
                              height: 20.0,
                              margin: EdgeInsets.only(
                                right: 12.0,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(6.0),
                                  border: Border.all(
                                    color: Color(0xff868290),
                                    width: 1.5,
                                  )),
                              child: Image(
                                image:
                                    AssetImage("assets/images/check_icon.png"),
                              ),
                            ),
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                hintText: "enter ToDo item...",
                                border: InputBorder.none,
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ]),
              Positioned(
                bottom: 24.0,
                right: 24.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Taskpage(
                                  task: null,
                                )));
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 250, 142, 54),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image.asset("assets/images/delete_icon.png"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
