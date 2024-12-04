import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  // Liste des tâches
  final List<Map<String, String>> tasks = [
    {'title': 'Tâche 1', 'description': 'Description de la tâche 1'},
    {'title': 'Tâche 2', 'description': 'Description de la tâche 2'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Tâches'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]['title']!),
            subtitle: Text(tasks[index]['description']!),
            onTap: () {
              // Navigation vers la page des détails avec la tâche sélectionnée
              Navigator.pushNamed(
                context,
                '/details',
                arguments: tasks[index],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigation vers le formulaire d'ajout de tâche
          final newTask = await Navigator.pushNamed(context, '/form');
          if (newTask != null && newTask is Map<String, String>) {
            setState(() {
              tasks.add(newTask); // Ajout de la nouvelle tâche
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}