import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chuck Norris Joke Generator',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: ChuckView(),
    );
  }
}

class _ChuckViewState extends State<ChuckView> {
  // State variables items here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Chuck Norris Jokes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Getting new Chuck Norris joke');
        },
        tooltip: 'Get new joke',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ChuckView extends StatefulWidget {
  @override
  State<ChuckView> createState() => _ChuckViewState();
}
