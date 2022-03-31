import 'package:flutter/material.dart';
import '../widgets/entry_info_body.dart';
import '../models/journal.dart';
import '../models/journal_entry.dart';
import '../widgets/journal_list_builder.dart';

class HorizontalLayout extends StatefulWidget {
  
  final Journal? journal;

  const HorizontalLayout({Key? key, required this.journal}) : super(key: key);

  @override
  _HorizontalLayoutState createState() => _HorizontalLayoutState();
}

class _HorizontalLayoutState extends State<HorizontalLayout> {
  
  JournalEntry? entrySelection;

  void entryInfoNavigator(BuildContext context, JournalEntry entry) {
    setState( () {
      entrySelection = entry;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: JournalListBuilder(journal: widget.journal, onTapFunction: entryInfoNavigator)
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [EntryInfoBody(entry: entrySelection)]
          )
        )
      ]
    );
  }
}