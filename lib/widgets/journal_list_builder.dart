import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/journal.dart';
import '../models/journal_entry.dart';
import '../db/database_manager.dart';

class JournalListBuilder extends StatelessWidget {
  
  final Journal? journal;
  final void Function(BuildContext context, JournalEntry entry) onTapFunction;
  
  const JournalListBuilder({Key? key, required this.journal, required this.onTapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: journal!.entryCount,
      itemBuilder:(context, index) {
        return ListTile(
          leading: const Icon(Icons.theater_comedy_rounded),
          trailing: const Icon(Icons.navigate_next_rounded),
          title: Text('${journal!.entries![index].title}'),
          subtitle: Text(DateFormat.yMMMMEEEEd().format(journal!.entries![index].dateTime!)),
          onTap: () => onTapFunction(context, journal!.entries![index]),
          onLongPress: () {
            AlertDialog alert = AlertDialog(
              title: const Text('Delete Entry?'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    final dbManager = DatabaseManager.getInstance();
                    dbManager.deleteJournalEntry(dto: journal!.entries![index]);
                    Navigator.pop(context);
                  }
                ),
                TextButton(
                  child: const Text('No'),
                  onPressed: () => Navigator.pop(context)
                )
              ]
            );
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return alert;
              }
            );
          }
        );
      }
    );
  }
}