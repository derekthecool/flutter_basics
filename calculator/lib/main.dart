import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Add this to center Row content
            children: <Widget>[
              Text("Test text"),
              Text("tester tester"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("This is a column"),
                  Text("next column"),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
