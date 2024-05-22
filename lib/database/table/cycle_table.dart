import 'package:sqflite/sqflite.dart';

import '../database_helper.dart';

class CycleTable {
  static const String CYCLE_TABLE = "CYCLE_TABLE";
  static const String cycleId = "Cycle_ID";
  static const String name = "Name";
  static const String category = "Category";
  static const String status = "Status";
  static const String available = "Available";
  static const String reqId = "ReqId";
  static const String requestDate = "RequestDate";
  static const String requestStatus = "RequestStatus";

  static const String CREATE = '''
    CREATE TABLE IF NOT EXISTS $CYCLE_TABLE (
      $cycleId TEXT PRIMARY KEY,
      $name TEXT DEFAULT '',
      $category TEXT DEFAULT '',
      $status TEXT DEFAULT '',
      $available TEXT DEFAULT '',
      $reqId TEXT DEFAULT '',
      $requestDate TEXT DEFAULT '',
      $requestStatus TEXT DEFAULT ''
    )
  ''';

  // Define a function that inserts a cycle into the database
  Future<void> insert(Map<String, dynamic> map) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    // Get a reference to the database.
    final db = await databaseHelper.database;
    // In this case, replace any previous data.
    await db.insert(
      CYCLE_TABLE,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Method to retrieve all cycles from the database
  Future<List<Map<String, dynamic>>> getAllCycles() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    final db = await databaseHelper.database;
    return await db.query(CYCLE_TABLE);
  }

  // Method to delete all cycle data from the database
  Future<int> deleteAllCycles() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    final db = await databaseHelper.database;
    return await db.delete(
      CYCLE_TABLE,
    );
  }
}
