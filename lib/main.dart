import 'package:flutter/material.dart';
import 'package:ids_material_sdk_example/search_dalog_example.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  // Dummy data for the ListView
  // final List<String> items = List<String>.generate(20, (index) => "Item ${index + 1}");
  final List<String> items = [];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      items.add("Search Dialog Code Example");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(items[index][0]), // Display the first letter
              ),
              title: Text(items[index]),
              subtitle: Text("Subtitle for ${items[index]}"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Action when tapped
                switch(index){
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchDialogExample()),
                    );
                    break;
                }
                print("Tapped on ${items[index]}");
              },
            );
          },
        ),
      ),
    );
  }
}
