import 'dart:async';

import 'package:db_sql/Provider/count_provider.dart';
import 'package:db_sql/Provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCount();
      // countProvider.setRadius();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print("Build");
    return Scaffold(
      appBar: AppBar(title: const Text("Provider")),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            countProvider.setCount();
          },
          child: Icon(Icons.add)),
      body: Column(
        children: [
          Consumer<CountProvider>(builder: (context, value, child) {
            return Center(
              child: Text(
                DateTime.now().hour.toString() +
                    ":" +
                    DateTime.now().minute.toString() +
                    ":" +
                    DateTime.now().second.toString(),
                style: TextStyle(fontSize: 50),
              ),
            );
          }),
          Consumer<CountProvider>(builder: (context, value, child) {
            return Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.lime,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(value.topLeft),
                    topRight: Radius.circular(value.topRight),
                    bottomLeft: Radius.circular(value.bottomLeft),
                    bottomRight: Radius.circular(value.bottomRight),
                  )),
            );
          }),
          Consumer<CountProvider>(
            builder: (context, value, child) {
              print("Only this widget build");
              return Text(
                "${value.count}",
                style: TextStyle(fontSize: 40),
              );
            },
          ),
        ],
      ),
    );
  }
}
