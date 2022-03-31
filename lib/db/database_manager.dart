import 'package:sqflite/sqflite.dart';
import 'journal_entry_dto.dart';
import '../models/journal_entry.dart';

class DatabaseManager {

  static const String databaseFilename = 'journal.sqlite3.db';
  static const String sqlInsert = 'INSERT INTO journal_entries(title, body, rating, date) VALUES(?, ?, ?, ?);';
  static const String sqlSelect = 'SELECT * FROM journal_entries;';
  static const String sqlDelete = 'DELETE FROM journal_entries WHERE title = ? AND date = ?';

  static DatabaseManager? _instance;

  final Database? db;

  DatabaseManager._({Database? database}) : db = database;

  factory DatabaseManager.getInstance() {
    assert(_instance != null);
    return _instance!;
  }

  static Future initialize(String createSchema) async {
    final db = await openDatabase(
      databaseFilename, 
      version: 1,
      onCreate: (Database db, int version) async {
        createTables(db, createSchema);
      }
    );
    _instance = DatabaseManager._(database: db);
  }

  static void createTables(Database db, String sql) async {
    await db.execute(sql);
  }

  void saveJournalEntry({JournalEntryDTO? dto}) {
    db!.transaction( (txn) async{
      await txn.rawInsert(sqlInsert,
        [dto!.title, dto.review, dto.rating, dto.dateTime.toString()]
      );
    });
  }

  void deleteJournalEntry({JournalEntry? dto}) {
    db!.transaction( (txn) async{
      await txn.rawDelete(sqlDelete,
        [dto!.title, dto.dateTime.toString()]
      );
    });
  }

  Future<List<Map<String, dynamic>>> journalEntries() {
    return db!.rawQuery(sqlSelect);
  }

}