import 'package:flutter/material.dart';
import '../widgets/settings_drawer.dart';
import '../widgets/entry_info_body.dart';
import '../models/journal_entry.dart';

class EntryInfo extends StatelessWidget {
  
  static const routeName = 'entryInfo';
  
  const EntryInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final JournalEntry? entry = ModalRoute.of(context)!.settings.arguments as JournalEntry?;
    
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text('${entry!.title} Review'),
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
      body: EntryInfoBody(entry: entry)
    );
  }
}