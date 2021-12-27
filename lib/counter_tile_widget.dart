import 'package:flutter/material.dart';

class CounterTileWidget extends StatelessWidget {
  const CounterTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30, top: 5),
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
          contentPadding: EdgeInsets.all(3),
          leading: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            mini: true,
            child: const Icon(Icons.remove),
          ),
          title: const Text(
            "Thing  3",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          trailing: FloatingActionButton(
            onPressed: () {},
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
}
