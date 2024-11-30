class Info{
   int? id;
   String? category;
   String? amount;

  infoMap(){
    var mapping = <String, dynamic>{};
    mapping['id'] = id;
    mapping['category'] = category;
    mapping['amount'] = amount;
    return mapping;
  }
}

