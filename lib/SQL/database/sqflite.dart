import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:wahyu_belajar_flutter/SQL/models/user_models.dart';

class DBHelper {
  static Future<Database> db () async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath,'ny_app.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, email text, password TEXT)'
        );
      },
      version: 1,
    );
  }

  static Future<void> registerUser(UserModel user) async{
    final dbs = await db();
    await dbs.insert('user', user.toMap());
  }
  static Future<UserModel?> loginUser ({
    required String email, 
    required String password, 
}) async {
  final dbs = await db();
  final List<Map<String, dynamic>> results = await dbs.query(
    "user",
    where: 'email = ? AND password = ?',
    whereArgs: [email, password],
  );
  if (results.isNotEmpty) {
    return UserModel.fromMap(results.first);
  }
  return null;
 }
}