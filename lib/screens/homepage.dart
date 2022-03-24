// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_flutter/database_helper.dart';
import 'package:todo_flutter/screens/taskpage.dart';
import 'package:todo_flutter/widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DatabaseHelper _dbHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 142, 54),
      body: SafeArea(
        child: Container(
          // ignore: prefer_const_constructors
          width: double.infinity,
          // ignore: prefer_const_constructors
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 32.0,
          ),
          // ignore: prefer_const_literals_to_create_immutables
          child: Stack(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: 32.0,
                  ),
                  child: Text(
                    'toDo :)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: FutureBuilder<dynamic>(
                    initialData: [],
                    future: _dbHelper.getTasks(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Taskpage(
                                          task: snapshot.data[index],
                                        )),
                              );
                            },
                            child: TaskCardWidget(
                              title: snapshot.data[index].title,
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              ]),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Taskpage(
                                task: null,
                              )),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 250, 142, 54),
                        Color.fromARGB(255, 248, 160, 87)
                      ]),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image.asset("assets/images/add_icon.png"),
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
