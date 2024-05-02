import 'package:sqflite/sqflite.dart';
import '../database_helper.dart';

class UserTable {
  static const String USER_TABLE = "USER_TABLE";
  static const String userName = "USER_NAME";
  static const String employeeId = "EMPLOYEE_ID";
  static const String userId = "USER_ID";
  static const String password = "PASSWORD";
  static const String mobileNo = "MOBILE_NO";
  static const String email = "EMAIL";
  static const String idFront = "ID_FRONT";
  static const String idBack = "ID_BACK";
  static const String profilePicture = "PROFILE_PICTURE";
  static const String sessionId = "SESSION_ID";

  static const String CREATE = '''
    CREATE TABLE IF NOT EXISTS $USER_TABLE (
    $userName TEXT PRIMARY KEY,
    $employeeId TEXT DEFAULT '',
    $userId TEXT DEFAULT '',
    $password TEXT DEFAULT '',
    $mobileNo TEXT DEFAULT '',
    $email TEXT DEFAULT '',
    $idFront TEXT DEFAULT '',
    $idBack TEXT DEFAULT '',
    $profilePicture TEXT DEFAULT '',
    $sessionId TEXT DEFAULT ''
    )
  ''';

  // Define a function that inserts notes into the database
  Future<void> insert(Map<String, dynamic> map) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    // Get a reference to the database.
    final db = await databaseHelper.database;
    // In this case, replace any previous data.
    await db.insert(
      USER_TABLE,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
