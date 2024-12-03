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
    setState(() {
      getTotalExpense();
      getTotalIncome();
    });
    // Fetch the total expense on page load
  }

  // Fetch the total expense from the ExpService
  getTotalIncome() async {
    var resultIncome = await _Infoservice.totalIncome("Income");
    setState(() {
      // If the result is valid, update the _totalExpense value
      _totalIncome =
          resultIncome.isNotEmpty ? resultIncome[0]['SUM(amount)'] ?? 0.0 : 0.0;
    });
  }

  getTotalExpense() async {
    var resultExpense = await _Expservice.totalExpense("Expense");
    setState(() {
      // If the result is valid, update the _totalExpense value
      _totalExpense = resultExpense.isNotEmpty
          ? resultExpense[0]['SUM(amount)'] ?? 0.0
          : 0.0;
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
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Hero(
            tag: "btn1",
            child: ElevatedButton(
              onPressed: _navigate,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent,
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              child: const Text('Income'),
            ),
          ),
          Hero(
              tag: "btn2",
              child: ElevatedButton(
                onPressed: _navigate2,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                child: const Text('Expenses'),
              )),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          'Total Balance: \$${_totalIncome - _totalExpense}',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total Income: \$$_totalIncome',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        Text(
                          'Total Expense: \$$_totalExpense',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
