import 'database_manager.dart';
import '../models/journal_entry.dart';

class JournalEntryDAO {

  static Future<List<JournalEntry>> journalEntries({DatabaseManager? databaseManager}) async {

    final journalRecords = await databaseManager!.journalEntries();
    return journalRecords.map( (record) {
      return JournalEntry(
        title: record['title'] as String?,
        review: record['body'] as String?,
        rating: record['rating'] as int?,
        dateTime: DateTime.parse(record['date'] as String)
      );
    }).toList();

  }

}