// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String? title;
  final String? desc;

  TaskCardWidget({this.title, this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
        // ignore: prefer_const_constructors
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
        margin: EdgeInsets.only(
          bottom: 20.0,
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              title ?? "(Unnamed Task)",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Text(
                desc ?? "No description added.",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xff86829D),
                  height: 1.5,
                ),
              ),
            ),
          ],
        ));
  }
}

class TodoWidget extends StatelessWidget {
  dynamic text;
  bool isDone;
  TodoWidget({this.text, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 8.0,
      ),
      child: Row(
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            margin: EdgeInsets.only(
              right: 12.0,
            ),
            decoration: BoxDecoration(
                color: isDone
                    ? Color.fromARGB(255, 250, 142, 54)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(6.0),
                border: isDone
                    ? null
                    : Border.all(
                        color: Color(0xff868290),
                        width: 1.5,
                      )),
            child: Image(
              image: AssetImage("assets/images/check_icon.png"),
            ),
          ),
          Text(
            text ?? "(unnamed todo)",
            style: TextStyle(
              color: isDone ? Color(0xff211551) : Color(0xff868290),
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
