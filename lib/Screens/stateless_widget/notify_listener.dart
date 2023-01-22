import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(title: Text('Statless')),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: _toggle,
            builder: (context, value, child) {
              return TextFormField(
                obscureText: _toggle.value,
                decoration: InputDecoration(
                    hintText: 'Password',
                    suffix: IconButton(
                      onPressed: () {
                        _toggle.value = !_toggle.value;
                      },
                      icon: _toggle.value
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    )),
              );
            },
          ),
          Center(
              child: ValueListenableBuilder(
            valueListenable: _counter,
            builder: (context, value, child) {
              return Text(
                _counter.value.toString(),
                style: TextStyle(fontSize: 40),
              );
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
