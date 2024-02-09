import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

Future<String> fetchAndDecodeJson(String inputURL) async {
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
      var joke = data["value"];
      print(joke);
      return joke;
    } else {
      // Handling error, if the server does not return a status code of 200
      print('Failed to load data. Status code: ${response.statusCode}');
      return "Failed to load";
    }

    // Closing the HttpClient to free system resources
    httpClient.close();
  } catch (e) {
    // Handling any errors that occur during the request
    var error = 'Error: $e';
    print(error);
    return error;
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

  // fetchAndDecodeJson('https://api.chucknorris.io/jokes/random')
  var jokeList = [];

  Future<void> GetJoke() async {
    print('Getting new Chuck Norris joke');
    var joke =
        await fetchAndDecodeJson('https://api.chucknorris.io/jokes/random');
    setState(() {
      jokeList.add(joke);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Chuck Norris Jokes'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Flexible(
          //   // Add this
          //   child: ListView.builder(
          //       padding: const EdgeInsets.all(8),
          //       itemCount: jokeList.length,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Center(
          //             child: Text(
          //           '“${jokeList[index]}”',
          //           style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
          //         ));
          //       }),
          // ),

          Flexible(
            // Add this
            child: GridView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: jokeList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6, // Number of columns
                  crossAxisSpacing: 10, // Horizontal space between items
                  mainAxisSpacing: 10, // Vertical space between items
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            '“${jokeList[index]}”',
                            style: TextStyle(
                                fontSize: 22, fontStyle: FontStyle.italic),
                          ),
                        ),
                      ));
                }),
          ),

          // Container(
          //   height: 150,
          //   width: 150,
          //   child: ListTile(
          //     leading: Icon(Icons.spa),
          //     // trailing: Text(jokeList.firstOrNull),
          //     trailing: Text("tester"),
          //   ),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          GetJoke();
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
