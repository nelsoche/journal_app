import 'journal_entry.dart';

class Journal {

  final List<JournalEntry>? entries;
  
  const Journal({this.entries});

  int get entryCount => entries!.length;

}