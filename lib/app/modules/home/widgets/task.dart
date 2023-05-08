import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  const Task({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Color.fromARGB(255, 77, 77, 77)),
          ]),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: IntrinsicHeight(
        child: ListTile(
          contentPadding: const EdgeInsets.all(8),
          leading: Checkbox(value: true, onChanged: (value) {}),
          title: const Text(
            'Descrição da TASK',
            style: TextStyle(
                decoration: false ? TextDecoration.lineThrough : null),
          ),
          subtitle: Text(
            '08/05/2023',
            style: TextStyle(
                decoration: false ? TextDecoration.lineThrough : null),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(width: 1)),
        ),
      ),
    );
  }
}
