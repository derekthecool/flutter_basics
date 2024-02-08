import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

Future<void> fetchAndDecodeJson(String inputURL) async {
  final url = Uri.parse(inputURL);

  try {
    // Creating a HttpClient
    final httpClient = HttpClient();

    // Making the HTTP GET request
    final request =
        await httpClient.getUrl(url); // Use getUrl to make a GET request
    final response =
        await request.close(); // Close the request and get the response

    // Checking if the request was successful (status code 200)
    if (response.statusCode == 200) {
      // Reading the response content
      final jsonString = await response.transform(utf8.decoder).join();
      // Decoding the JSON
      final data = jsonDecode(jsonString);

      // Use the decoded data
      print(data);
    } else {
      // Handling error, if the server does not return a status code of 200
      print('Failed to load data. Status code: ${response.statusCode}');
    }

    // Closing the HttpClient to free system resources
    httpClient.close();
  } catch (e) {
    // Handling any errors that occur during the request
    print('Error: $e');
  }
}

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
          fetchAndDecodeJson('https://api.chucknorris.io/jokes/random');
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
