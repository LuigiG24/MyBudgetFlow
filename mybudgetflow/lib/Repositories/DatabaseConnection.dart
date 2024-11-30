import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

//Create a database connection
class DatabaseConnection {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, "mybudgetflow.db");
    var database = await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);

    return database;

  }
//Create a table  
  _onCreatingDatabase(Database database, int version) async {
    await database.execute( "CREATE TABLE  Income (id INTEGER PRIMARY KEY AUTOINCREMENT, Category TEXT, amount INTEGER)");
  }

}
