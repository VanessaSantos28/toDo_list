// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo_list_provider/app/modules/tasks/task_create_controller.dart';

class TaskCreatePage extends StatefulWidget {
  final TaskCreateController _controller;

  TaskCreatePage({
    Key? key,
    required TaskCreateController controller,
  })  : _controller = controller,
        super(key: key);

  @override
  State<TaskCreatePage> createState() => _TaskCreatePageState();
}

class _TaskCreatePageState extends State<TaskCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task'),
      ),
      body: Container(),
    );
  }
}
