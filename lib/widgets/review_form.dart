import 'package:flutter/material.dart';
import '../db/database_manager.dart';
import '../db/journal_entry_dto.dart';

class ReviewForm extends StatefulWidget {
  
  const ReviewForm({ Key? key }) : super(key: key);

  @override
  _ReviewFormState createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  
  final _formKey = GlobalKey<FormState>();
  final newEntry = JournalEntryDTO();
  int? ratingSelection;
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder()
              ),
              onSaved: (value) => newEntry.title = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a title';
                } else {
                  return null;
                }
              }
            ),
            const SizedBox(height: 15.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Review',
                border: OutlineInputBorder()
              ),
              minLines: 5,
              maxLines: null,
              onSaved: (value) => newEntry.review = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please input your review';
                } else {
                  return null;
                }
              }
            ),
            const SizedBox(height: 15.0),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                labelText: 'Rating',
                border: OutlineInputBorder()
              ),
              value: ratingSelection,
              items: <int>[1, 2, 3, 4, 5]
                .map<DropdownMenuItem<int>>((int value) => 
                  DropdownMenuItem<int>(value: value, child: Text('$value'))).toList(),
              onChanged: (int? value) {
                setState(() => ratingSelection = value!);
              },
              onSaved: (value) => newEntry.rating = value as int?,
              validator: (value) {
                if (value == null){
                  return 'Please provide a rating';
                } else {
                  return null;
                }
              }
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop()
                ),
                ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      newEntry.dateTime = DateTime.now();
                      final dbManager = DatabaseManager.getInstance();
                      dbManager.saveJournalEntry(dto: newEntry);
                      Navigator.of(context).pop();
                    }
                  }
                )
              ]
            )
          ]
        )
      )
    );
  }
}