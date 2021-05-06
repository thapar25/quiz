import 'package:flutter/material.dart';
import 'package:quiz/constants.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
        body: Center(
            child: Text("LOGGED IN"),
        ),
    );
  }
}
