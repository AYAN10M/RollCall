import 'package:flutter/material.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.scale(
          scale: 2,
          child: Switch(
              activeColor: Colors.deepPurple,
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  // take the switch output from here
                  print(isSwitched);
                });
              }),
        ),
      ),
    );
  }
}
