import 'package:sqflite/sqflite.dart';

import '../database_helper.dart';

class LoginTable {
  static const String LOGIN_TABLE = "LOGIN_TABLE";
  static const String userId = "USER_ID";
  static const String password = "Password";
  static const String sessionId = "SessionId";
  static const String userRole = "UserRole";

  static const String CREATE = '''
    CREATE TABLE IF NOT EXISTS $LOGIN_TABLE (
    $userId TEXT PRIMARY KEY,
    $password TEXT DEFAULT '',
    $sessionId TEXT DEFAULT '',
    $userRole TEXT DEFAULT ''
    )
  ''';

  // Define a function that inserts notes into the database
  Future<void> insert(Map<String, dynamic> map) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    // Get a reference to the database.
    final db = await databaseHelper.database;
    // In this case, replace any previous data.
    await db.insert(
      LOGIN_TABLE,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Method to retrieve all notes from the database
  Future<List<Map<String, dynamic>>> getUserData() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    final db = await databaseHelper.database;
    return await db.query(LOGIN_TABLE);
  }

  //filter out data 15 day or 30 day

  // Method to delete a note from the database
  Future<int> deleteUserData() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    final db = await databaseHelper.database;
    return await db.delete(
      LOGIN_TABLE,
      // whereArgs: [noteId],
    );
  }

  Future<int> updateSessionId(String userId, String newSessionId) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    final db = await databaseHelper.database;

    Map<String, dynamic> values = {
      'SessionId': newSessionId,
    };

    return await db.update(
      LOGIN_TABLE,
      values,
      where: 'USER_ID = ?',
      whereArgs: [userId],
    );
  }
}
