import 'package:sqflite/sqflite.dart';
import 'package:mybudgetflow/RepositoriesExpense/DatabaseExpense.dart';

class RepositoryExpense {
  DatabaseConnection? _databaseConnection;
  RepositoryExpense() {
    //Initialize the database connection
    _databaseConnection = DatabaseConnection();
  
  }

  static late Database _database;

  Future<Database> get database async { 
    _database = await _databaseConnection!.setdB();
    return _database;
    }

  //Insert data into the database
  insertData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
     }
  
  //Read data from the database
    readData(table) async {
      var connection = await database;
      return await connection.query(table);
    }

  readDataById(table, itemId) async {
    var connection = await database;
    return await connection.query(table, where: "id = ?", whereArgs: [itemId]);

  }

  deleteData(table, itemId) async {
      var connection = await database;  
      return await connection.rawDelete("Delete from $table where id = $itemId");

  } 

  
}
