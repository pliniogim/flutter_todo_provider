import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';


class AddTaskScreen extends StatelessWidget {

  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = "";


    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff757575),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 3.0,
            ),
            const Text(
              'Add a new Task',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 8.0,
              ),
              child: TextField(
                autofocus: true,
                onChanged: (newValue) {
                  newTaskTitle = newValue;
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen:false).addTask(newTaskTitle);
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                fixedSize: const Size(180.0, 20),
                primary: Colors.white,
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: const Text(
                'Add',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
