import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

//Create a database connection

class DatabaseConnection {  
   setdB() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, "mybudgetflowExpense.db");
    var database = await openDatabase(path, version: 1, onCreate: _onCreatingDatabaseExpense);
    return database;
    
  }
//Create a table  
  _onCreatingDatabaseExpense(Database database, int version) async {
    await database.execute( "CREATE TABLE  Expense (id INTEGER PRIMARY KEY AUTOINCREMENT, Category TEXT, amount INTEGER)");
  }

}