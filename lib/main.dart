import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _updateMathString(String number) {
    setState(() {
      mathString += number;
    });
  }

  String mathString = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Calculator'),
      ),
      body: Center(
        child: Column(
          children: [
            Wrap(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    mathString,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Divider(
                  height: 50,
                ),
                CalculatorButton(number: "1", onPressed: _updateMathString),
                CalculatorButton(number: "2", onPressed: _updateMathString),
                CalculatorButton(number: "3", onPressed: _updateMathString),
                CalculatorButton(number: "4", onPressed: _updateMathString),
                CalculatorButton(number: "5", onPressed: _updateMathString),
                CalculatorButton(number: "6", onPressed: _updateMathString),
                CalculatorButton(number: "7", onPressed: _updateMathString),
                CalculatorButton(number: "8", onPressed: _updateMathString),
                CalculatorButton(number: "9", onPressed: _updateMathString),
                CalculatorButton(number: "10", onPressed: _updateMathString),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.number,
    required this.onPressed,
  });

  final String number;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        child: ElevatedButton(
          onPressed: () {
            onPressed(number);
          },
          child: Text("$number"),
        ));
  }
}
