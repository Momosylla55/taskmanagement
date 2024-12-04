import 'package:flutter/material.dart';

class TaskDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(title: Text(task['title']!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Titre : ${task['title']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Description : ${task['description']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Date de début : ${task['startDate']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Date de fin : ${task['endDate']}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}