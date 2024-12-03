import 'package:flutter/material.dart';
import 'package:mybudgetflow/Services/InfoService.dart';
import 'package:mybudgetflow/ServicesExpense/ExpService.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _Expservice = Expservice();
  int _totalExpense = 0; // Variable to store the total expense

  var _Infoservice = Infoservice();
  int _totalIncome = 0; // Variable to store the total income

  @override
  void initState() {
    super.initState();
    getTotalExpense();
    getTotalIncome(); // Fetch the total expense on page load
  }

  // Fetch the total expense from the ExpService
  getTotalIncome() async {
    var resultIncome = await _Infoservice.totalIncome("Income");
    setState(() {
      // If the result is valid, update the _totalExpense value
      _totalIncome = resultIncome.isNotEmpty ? resultIncome[0]['SUM(amount)'] ?? 0.0 : 0.0;
    });
  }

  getTotalExpense() async {
    var resultExpense = await _Expservice.totalExpense("Expense");
    setState(() {
      // If the result is valid, update the _totalExpense value
      _totalExpense = resultExpense.isNotEmpty ? resultExpense[0]['SUM(amount)'] ?? 0.0 : 0.0;
    });
  }

  void _navigate() {
    Navigator.pushNamed(context, "/Income");
  }

  void _navigate2() {
    Navigator.pushNamed(context, "/Expenses");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("MyBudgetFlow"),
        toolbarHeight: 100,
        titleSpacing: 125,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          ElevatedButton(
            onPressed: _navigate,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              textStyle: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            child: const Text('Income'),
          ),
          ElevatedButton(
            onPressed: _navigate2,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              textStyle: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
            ),
            child: const Text('Expenses'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Balance: \$${_totalIncome - _totalExpense}', // Format the amount to 2 decimal places
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Display the total expense here
            Text(
              'Total Expense: \$$_totalExpense', // Format the amount to 2 decimal places
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Total Income: \$$_totalIncome', // Format the amount to 2 decimal places
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
