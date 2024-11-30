import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key, required this.title});

  final String title;

  @override
  State<Expenses> createState() => _ExpensesState();
}


class _ExpensesState extends State<Expenses> {
  
  // Method to navigate home
  void navigatehome() {
    Navigator.pop(context);
  }
  void navigateaddinfo() {
    Navigator.pushNamed(context, "/AddInfo");
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
      body: Text("Expense"), 
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
