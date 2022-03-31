import 'package:flutter/material.dart';
import '../models/journal.dart';
import '../models/journal_entry.dart';
import '../widgets/journal_list_builder.dart';
import '../screens/entry_info.dart';

class VerticalLayout extends StatelessWidget {
  
  final Journal? journal;
  
  const VerticalLayout({Key? key, required this.journal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JournalListBuilder(journal: journal, onTapFunction: entryInfoNavigator);
  }
}

void entryInfoNavigator(BuildContext context, JournalEntry entry) {
  Navigator.of(context).pushNamed(EntryInfo.routeName, arguments: entry);
}