import 'package:counter/models/tables.dart';
import 'package:drift/drift.dart' as df;
import 'package:flutter/material.dart';

import 'counter_tile_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _displayDialog(BuildContext context, MyDatabase database) async {
    final thingsController = TextEditingController();

    Widget okButton = TextButton(
      child: const Text("Add"),
      onPressed: () {
        final name = thingsController.text.trim();
        if (name.isNotEmpty) {
          database.insertThing(ThingsCompanion(name: df.Value(name)));
          Navigator.of(context, rootNavigator: true).pop('dialog');
        }
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Add a new thing"),
      content: TextFormField(
        controller: thingsController,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Enter name',
        ),
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final database = MyDatabase();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder<List<Thing>>(
          stream: database.watchAllThings(),
          builder: (context, snapshot) {
            final things = snapshot.data;
            if (things == null) {
              return const Text("No things");
            } else {
              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: things.length,
                itemBuilder: (ctx, idx) {
                  final thing = things[idx];
                  return CounterTileWidget(thing: thing, database: database);
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _displayDialog(context, database);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
