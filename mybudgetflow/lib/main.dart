import 'package:mybudgetflow/Pages/addInfoExpense.dart';
import 'package:mybudgetflow/pages/Home.dart';
import 'package:mybudgetflow/pages/Income.dart';
import 'package:mybudgetflow/pages/Expenses.dart';
import 'package:flutter/material.dart';
import 'package:mybudgetflow/pages/addInfo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyBudgetFlow',
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(title:"MyBudgetFlow"),
        "/Income": (context) => Income(title: "Income"),
        "/Expenses": (context) => Expenses(title: "Expenses"),
        "/AddInfo": (context) => AddInfo(title: "AddInfo"),
        "/addinfoexpense": (context) => AddInfoExpense(title: "AddInfoExpense"),
        },
    );
  }
}

