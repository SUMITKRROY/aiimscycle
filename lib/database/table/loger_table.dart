
import 'package:sqflite/sqflite.dart';
import '../database_helper.dart';

class LoggerListTable {
  static const String LOGGER_TABLE = "logger";
  static const String id = "Id";
  static const String description = "Description";
  static const String screenName = "ScreenName";
  static const String date = "Date";
  static const String time = "Time";


  static const String CREATE = '''
    CREATE TABLE IF NOT EXISTS $LOGGER_TABLE (
    $id TEXT PRIMARY KEY,
    $description TEXT DEFAULT '',
    $screenName TEXT DEFAULT '',  
    $date TEXT DEFAULT '',       
    $time TEXT DEFAULT ''
    )
  ''';


  // Define a function that inserts notes into the database
  Future<void> insert(Map<String, dynamic> map) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    // Get a reference to the database.
    final db = await databaseHelper.database;
    // In this case, replace any previous data.
    await db.insert(
      LOGGER_TABLE,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Method to retrieve all notes from the database
  Future<List<Map<String, dynamic>>> getPlayList() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    final db = await databaseHelper.database;
    return await db.query(LOGGER_TABLE);
  }
  //filter out data 15 day or 30 day

  // Method to delete a note from the database
  Future<int> deleteNote(int noteId) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    final db = await databaseHelper.database;
    return await db.delete(
      LOGGER_TABLE,
      where: '$id = ?',
     // whereArgs: [noteId],
    );
  }


  // Method to get note details by ID
  Future<Map<String, dynamic>> getLoggerById(int noteId) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    final db = await databaseHelper.database;

    List<Map<String, dynamic>> result = await db.query(
      LOGGER_TABLE,
      where: '$id = ?',
     // whereArgs: [noteId],
    );

    // If the query returns a result, return the first (and only) row
    if (result.isNotEmpty) {
      return result.first;
    } else {
      // If no result is found, return an empty map or handle it as needed
      return {};
    }
  }
}
