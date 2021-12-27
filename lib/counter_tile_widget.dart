import 'package:flutter/material.dart';

import 'models/tables.dart';

class CounterTileWidget extends StatelessWidget {
  final Thing thing;
  final MyDatabase database;
  CounterTileWidget({Key? key, required this.thing, required this.database})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 5),
      child: Card(
        elevation: 6,
        shape: const StadiumBorder(
          side: BorderSide(
            color: Colors.grey,
            style: BorderStyle.solid,
            width: 1.0,
          ),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(3),
          leading: FloatingActionButton(
            onPressed: () {
              updateCount(thing, thing.count - 1);
            },
            tooltip: 'Increment',
            mini: true,
            child: const Icon(Icons.remove),
          ),
          title: Text(
            "${thing.name} : ${thing.count}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
          trailing: FloatingActionButton(
            onPressed: () {
              updateCount(thing, thing.count + 1);
            },
            tooltip: 'Increment',
            mini: true,
            child: const Icon(Icons.add),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  updateCount(Thing thing, int count) {
    if (count < 0) {
      database.deleteByThingId(thing.id);
    } else {
      database.updateCountByThingId(thing.id, count);
    }
  }
}
