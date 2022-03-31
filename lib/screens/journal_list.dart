import 'package:flutter/material.dart';
import 'entry_form.dart';
import '../db/database_manager.dart';
import '../db/journal_entry_dao.dart';
import '../widgets/welcome.dart';
import '../widgets/settings_drawer.dart';
import '../models/journal.dart';
import '../models/journal_entry.dart';
import '../layouts/vertical_layout.dart';
import '../layouts/horizontal_layout.dart';

class JournalList extends StatefulWidget {
  
  static const routeName = '/';
  
  const JournalList({Key? key}) : super(key: key);

  @override
  _JournalListState createState() => _JournalListState();
}

class _JournalListState extends State<JournalList> {
  
  Journal? journal;
  
  @override
  void initState(){
    super.initState();
    loadJournal();
  }

  void loadJournal() async {
    final dbManager = DatabaseManager.getInstance();
    List<JournalEntry> entries = await JournalEntryDAO.journalEntries(databaseManager: dbManager);
    setState(() {
      journal = Journal(entries: entries);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    loadJournal();
    return Scaffold(
      appBar: AppBar(
        title: const Text('TheatreBoxd'),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip
            ),
          )
        ]
      ),
      endDrawer: const SettingsDrawer(),
      body: LayoutBuilder(builder: layoutCalculator),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(EntryForm.routeName),
        child: const Icon(Icons.add)
      ),
    );
  }

  Widget layoutCalculator(BuildContext context, BoxConstraints constraints) {
    if (journal == null) {
      return const CircularProgressIndicator();
    } else if (journal!.entryCount == 0) {
      return const Welcome();
    } else {
      return constraints.maxWidth < 800 ? VerticalLayout(journal: journal) : HorizontalLayout(journal: journal);
    }
  }
}