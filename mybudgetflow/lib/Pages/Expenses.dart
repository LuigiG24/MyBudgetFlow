import 'package:flutter/material.dart';
import 'package:mybudgetflow/ModelsExpense/Exp.dart';
import 'package:mybudgetflow/ServicesExpense/ExpService.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key, required this.title});

  final String title;

  @override
  State<Expenses> createState() => _ExpensesState();
}


class _ExpensesState extends State<Expenses> {

  var _Expservice = Expservice();
  List<Exp> _explist = <Exp>[];

  @override
  void initState() {
    super.initState();
    getAllExp();
  }

  getAllExp() async {
    _explist = [];
    // Reading the data from the database
    var expData = await _Expservice.readInfo();
    print(expData);

    // Converting the data into Exp model
    expData.forEach((exp) {
      setState(() {
        var expModel = Exp();
        expModel.category = exp['Category'];
        if (exp['amount'] != null) {
          expModel.amount = exp['amount'].toString();  // Convert to string if not null
        } else {
          expModel.amount = '0';  // Default value if null
        }
        if (exp['id'] != null) {
          // Ensure id is an integer
          expModel.id = int.tryParse(exp['id'].toString());  // Convert to int if possible
        } else {
          expModel.id = null;  // Set to null if not present
        }

        _explist.add(expModel);
      });
    });
  }
  
  // Method to navigate home
  void navigatehome() {
    Navigator.pop(context);
  }
  void navigateaddinfoexpense() {
    Navigator.pushNamed(context, "/addinfoexpense");
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
        itemCount: _explist.length,
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
                      _explist[index].category ?? 'No category',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color:  Colors.red),
                    ),
                    Container(child: Row(
                      children: [
                        Text("USD", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                      _explist[index].amount ?? 'No amount',
                      style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold,),
                    ),
                      ],
                    ),),
                
                  ],
                ),
                trailing: IconButton(
                  onPressed: () async {
                    var result  = await _Expservice.deleteInfo(_explist[index].id!);
                    if (result >= 0) {
                      getAllExp() ; 
                    }   
                  },
                  icon: Icon(Icons.delete, color: Colors.blueAccent),
                ),
              ),
            ),
          );

        }
        
        ),
      // Floating Action Button
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
              onPressed: navigateaddinfoexpense,
              backgroundColor: Colors.blueAccent,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
