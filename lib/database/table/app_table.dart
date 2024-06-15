import 'package:sqflite/sqflite.dart';
import '../database_helper.dart';

class AppTable {
  static const String App_Table = "App_Table";
  static const String clientId = "ClientId";
  static const String theme = "Theme";
  static const String language = "Language";
  static const String debugFlag = "DebugFlag";
  static const String logFlag = "LogFlag";

  static const String CREATE = '''
    CREATE TABLE IF NOT EXISTS $App_Table (
    $clientId TEXT PRIMARY KEY,
    $theme TEXT DEFAULT '',
    $language TEXT DEFAULT '',
    $debugFlag TEXT DEFAULT '',
    $logFlag TEXT DEFAULT ''
    )
  ''';

  // Define a function that inserts notes into the database
  Future<void> insert(Map<String, dynamic> map) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    // Get a reference to the database.
    final db = await databaseHelper.database;
    // In this case, replace any previous data.
    await db.insert(
      App_Table,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Method to retrieve all notes from the database
  Future<List<Map<String, dynamic>>> getAppTable() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    final db = await databaseHelper.database;
    return await db.query(App_Table);
  }

  // Method to delete a note from the database
  Future<int> deleteAppTable() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    final db = await databaseHelper.database;
    return await db.delete(
      App_Table,
    );
  }

  Future<int> updateClientId(String clientId, String newClientId) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    final db = await databaseHelper.database;

    Map<String, dynamic> values = {
      'ClientId': newClientId,
    };

    return await db.update(
      App_Table,
      values,
      where: 'ClientId = ?',
      whereArgs: [clientId],
    );
  }

  Future<int> updateThemeColor(String clientId, String theme) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    final db = await databaseHelper.database;

    Map<String, dynamic> values = {
      'Theme': theme,
    };

    return await db.update(
      App_Table,
      values,
      where: 'ClientId = ?',
      whereArgs: [clientId],
    );
  }


}
