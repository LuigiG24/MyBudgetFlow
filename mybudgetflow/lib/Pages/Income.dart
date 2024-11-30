import 'package:flutter/material.dart';
import 'package:mybudgetflow/Models/Info.dart';
import 'package:mybudgetflow/Services/InfoService.dart';

class Income extends StatefulWidget {
  const Income({super.key, required this.title});

  final String title;

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  var _Infoservice = Infoservice();
  List<Info> _infolist = <Info>[];

  @override
  
  void initState() {
    
    super.initState();
    getAllInfos();
     }

  getAllInfos() async {
    _infolist = [];
    // Reading the data from the database
    var infosData = await _Infoservice.readInfo();
    print(infosData);

    // Converting the data into Info model
    infosData.forEach((info) {
      setState(() {
        var infoModel = Info();
        infoModel.category = info['Category'];
        
         if (info['amount'] != null) {
        infoModel.amount = info['amount'].toString();  // Convert to string if not null
      } else {
        infoModel.amount = '0';  // Default value if null
      }

        if (info['id'] != null) {
          // Ensure id is an integer
          infoModel.id = int.tryParse(info['id'].toString());  // Convert to int if possible
        } else {
          infoModel.id = null;  // Set to null if not present
        }
        _infolist.add(infoModel);
      });
    });
  }

  // Method to navigate home
  void navigatehome() {
    Navigator.pop(context);
  }

  void navigateaddinfo() {
    Navigator.pushNamed(context, "/AddInfo");
  }

  void navigateeditinfo(int i) {
    Navigator.pushNamed(context, "/editInfo");
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(widget.title),
        toolbarHeight: 100,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: _infolist.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
            child: Card(
              color: Colors.white,
              elevation: 8.0,
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    
                    Text(
                      _infolist[index].category ?? 'No category',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: const Color.fromARGB(255, 6, 164, 11)),
                    ),
                    Container(child: Row(
                      children: [
                        Text("USD", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                      _infolist[index].amount ?? 'No amount',
                      style: TextStyle(color: Color.fromARGB(255, 6, 164, 11), fontSize: 18, fontWeight: FontWeight.bold,),
                    ),
                      ],
                    ),),
                
                  ],
                ),
                trailing: IconButton(
                  onPressed: () async {
                    var result  = await _Infoservice.deleteInfo(_infolist[index].id!);
                    if (result >= 0) {
                      getAllInfos() ; 
                    }   
                  },
                  icon: Icon(Icons.delete, color: Colors.blueAccent),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: navigatehome,
              backgroundColor: Colors.blueAccent,
              child: const Icon(Icons.home, color: Colors.white),
            ),
            FloatingActionButton(
              onPressed: navigateaddinfo,
              backgroundColor: Colors.blueAccent,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
