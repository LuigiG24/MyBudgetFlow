class Exp{
   int? id;
   String? category;
   String? amount;

  expMap(){
    var mapping = <String, dynamic>{};
    mapping['id'] = id;
    mapping['category'] = category;
    mapping['amount'] = amount;
    return mapping;
  }
}
