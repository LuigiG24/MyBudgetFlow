import 'package:mybudgetflow/ModelsExpense/Exp.dart';
import 'package:mybudgetflow/RepositoriesExpense/RepositoryExpense.dart';

class Expservice {
  RepositoryExpense? _repositoryExpense;
  Expservice(){
    _repositoryExpense = RepositoryExpense();
  }

  //Creating Data
  saveInfo(Exp exp, String text) async {
    return  await _repositoryExpense!.insertData("Expense", exp.expMap());
    
  }
  //Reading Data
  readInfo() async {
    return await _repositoryExpense!.readDataExpense("Expense");
    
}
  //Reading Data by Id
  readInfobyId(expId) {
    return _repositoryExpense!.readDataById("Expense", expId);
  }

  //Deleting Data
  deleteInfo(expId) async {
    return await _repositoryExpense!.deleteData( "Expense", expId);
  }


  totalExpense(table) async {
    return await _repositoryExpense!.totalExpense("Expense");
  }
}