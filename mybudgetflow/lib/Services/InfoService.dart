import 'package:mybudgetflow/Models/Info.dart';
import 'package:mybudgetflow/Repositories/Repository.dart';

class Infoservice {
  Repository? _repository;

  Infoservice(){
    _repository = Repository();
  }


  //Creating Data
  saveInfo(Info info, String text) async {
    return  await _repository!.insertData("Income", info.infoMap());
    
  }
  //Reading Data
  readInfo() async {
    return await _repository!.readData("Income");
    
}
  //Reading Data by Id
  readInfobyId(infoId) {
    return _repository!.readDataById("Income", infoId);
  }

  //Deleting Data
  deleteInfo(infoId) async {
    return await _repository!.deleteData( "Income", infoId);
  }
}