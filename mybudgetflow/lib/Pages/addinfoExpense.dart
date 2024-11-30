import 'package:flutter/material.dart';
import 'package:mybudgetflow/ModelsExpense/Exp.dart';
import 'package:mybudgetflow/ServicesExpense/ExpService.dart';


class AddInfoExpense extends StatefulWidget {
  const AddInfoExpense({super.key, required this.title});

  final String title;

  @override
  State<AddInfoExpense> createState() => _AddInfoExpenseState();
}

class _AddInfoExpenseState extends State<AddInfoExpense> {

  var _Categorycontroller = TextEditingController();
  var _Amountcontroller = TextEditingController();
  
  var _Exp = Exp();
  var _Expservice = Expservice();

  void lastpage() {
      Navigator.pop(context); 
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
      body: Padding(padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                controller: _Categorycontroller,
                decoration: const InputDecoration(
                labelText: "Category",
                hintText: "Enter the category",
              ),
            ),
            TextFormField(
              controller: _Amountcontroller,
              decoration: const InputDecoration(
                labelText: "Amount",
                hintText: "Enter the amount",
              ),  
            ),
          ],
          ),
        ),
      // Floating Action Button
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () async{
                _Exp.category = _Categorycontroller.text;
                _Exp.amount = _Amountcontroller.text;
                var result = await _Expservice.saveInfo(_Exp, context.toString());
                print(result);
                lastpage();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent,
                textStyle: const TextStyle(color: Colors.white, fontSize: 18  , fontWeight: FontWeight.bold),
              ),
              child: const Icon(Icons.save, color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}