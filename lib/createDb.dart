// import 'dart:async';

// import 'package:sqflite/sqflite.dart';

// createDatabase() async {
//   String databasePath = await getDatabasesPath();
//   String dbPATH = databasePath + 'group.db';
//   var DATABASE = await openDatabase(dbPATH, version: 1, onCreate: GroupDb);
//   return DATABASE;
// }

// FutureOr<void> GroupDb(Database database, int version) async {
//   await database.execute("CREATE TABLE Groups("
//       "PhoneID TEXT PRIMARY KEY,"
//       "GroupName TEXT"
//       ")");
// }

// class DbHelperGroup {
//   static final DbHelperGroup _dbHelperGroup = DbHelperGroup._internal();
//   String tblName = "GroupTable";
//   String colPhoneId = "PhoneId";
//   String colGroupName = "GroupName";
// }
