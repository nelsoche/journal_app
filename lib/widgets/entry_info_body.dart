import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/journal_entry.dart';

class EntryInfoBody extends StatelessWidget {
  
  final JournalEntry? entry;

  const EntryInfoBody({Key? key, required this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    if(entry == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text('Select an entry')
        )
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${entry!.title}', style: Theme.of(context).textTheme.headline5),
          const SizedBox(height: 10.0),
          Text(
            DateFormat.yMMMMEEEEd().format(entry!.dateTime!)),
          const SizedBox(height: 10.0),
          Text(
            'Rating: ${entry!.rating}/5', 
            style: const TextStyle(fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 20.0),
          Container(
            child: Text('${entry!.review}',
                style: Theme.of(context).textTheme.headline6),
            padding: const EdgeInsets.symmetric(horizontal: 40),
            alignment: Alignment.centerLeft,
          ),
        ]
      )
    );
  }
}