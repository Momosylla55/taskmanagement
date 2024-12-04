import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> taskData = {};
  DateTime? _startDate;
  DateTime? _endDate;

  // Fonction pour afficher le sélecteur de date
  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          _startDate = pickedDate;
        } else {
          _endDate = pickedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter une Tâche'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Champ Titre
              TextFormField(
                decoration: InputDecoration(labelText: 'Titre'),
                onSaved: (value) => taskData['title'] = value!,
                validator: (value) => value == null || value.isEmpty ? 'Entrez un titre' : null,
              ),
              SizedBox(height: 10),
              // Champ Description
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) => taskData['description'] = value!,
                validator: (value) => value == null || value.isEmpty ? 'Entrez une description' : null,
              ),
              SizedBox(height: 10),
              // Sélection de la date de début
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _startDate == null
                          ? 'Date de début : Non sélectionnée'
                          : 'Date de début : ${_startDate!.toLocal()}'.split(' ')[0],
                    ),
                  ),
                  TextButton(
                    onPressed: () => _selectDate(context, true),
                    child: Text('Sélectionner'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Sélection de la date de fin
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _endDate == null
                          ? 'Date de fin : Non sélectionnée'
                          : 'Date de fin : ${_endDate!.toLocal()}'.split(' ')[0],
                    ),
                  ),
                  TextButton(
                    onPressed: () => _selectDate(context, false),
                    child: Text('Sélectionner'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Bouton d'enregistrement
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    taskData['startDate'] = _startDate != null
                        ? _startDate!.toIso8601String().split('T')[0]
                        : 'Non spécifiée';
                    taskData['endDate'] = _endDate != null
                        ? _endDate!.toIso8601String().split('T')[0]
                        : 'Non spécifiée';
                    Navigator.pop(context, taskData);
                  }
                },
                child: Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}