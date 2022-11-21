import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Color? boxColor;

  const TaskContainer({
    super.key,
    this.title,
    this.subtitle,
    this.boxColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: boxColor, borderRadius: BorderRadius.circular(25.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title!,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              subtitle!,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
