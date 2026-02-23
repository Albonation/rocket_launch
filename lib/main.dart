import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocket Launch Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  // set counter value
  int _counter = 0;

  Widget igniteButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _counter++;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: const Text('Ignite'),
    );
  }

  Widget decrementButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (_counter > 0) {
            _counter--;
          }
          else {
            _counter = 0;
          }
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: const Text('Decrement'),
    );
  }

  Widget abortButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _counter = 0;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: const Text('Abort'),
    );
  }

  Widget buildCounterDisplay() {
    Color backgroundColor;
    if (_counter == 0) {
      backgroundColor = Colors.red;
    } else if (_counter <= 50) {
      backgroundColor = Colors.orange;
    }  else {
      backgroundColor = Colors.green;
    }

    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(20.0),
      child: Text(
        '$_counter',
        style: const TextStyle(
            fontSize: 50.0,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Launch Controller'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:
              buildCounterDisplay(),
          ),
          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
                _counter = value.toInt();
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
          ),
          igniteButton(),
          decrementButton(),
          abortButton(),
        ],
      ),
    );
  }
}