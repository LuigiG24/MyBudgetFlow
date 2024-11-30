import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        floatingActionButton:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
              onPressed: _navigate,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent,
                textStyle: const TextStyle(color: Colors.white, fontSize: 18  , fontWeight: FontWeight.bold),
              ),
              child: const Text('Incomes'),
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
        body: const  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to MyBudgetFlow'),
            ],
          ),
        )
        );
     }
}
