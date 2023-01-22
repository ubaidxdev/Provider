import 'package:db_sql/Provider/example_one_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  @override
  Widget build(BuildContext context) {
    final providerOne = Provider.of<ExampleOneProvider>(context, listen: false);
    print("Build");
    return Scaffold(
      appBar: AppBar(title: Text("Example One Screen")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: (context, val, child) {
            return Slider(
              min: 0,
              max: 1,
              value: val.value,
              onChanged: (value) {
                val.setSliderValue(value);
                // sliderValue = value;
              },
            );
          }),
          Consumer<ExampleOneProvider>(builder: (context, val, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(providerOne.value),
                    ),
                    child: const Center(
                      child: Text("Container 1"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(providerOne.value),
                    ),
                    child: const Center(
                      child: Text("Container 2"),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
