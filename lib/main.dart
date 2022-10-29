import 'dart:ui';

import 'package:flutter/material.dart';

void main(List<String> args) => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text('Flutter TouchableOpacity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Reynald Prabha Nova',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            TouchableOpacity(
                onTap: () => print('tapped'),
                child: Container(
                  width: 150,
                  height: 50,
                  color: Color.fromARGB(255, 60, 167, 255),
                  child: Center(
                    child: Text(
                      'Cek Umur',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
    return MaterialApp(home: scaffold);
  }
}

class TouchableOpacity extends StatefulWidget {
  TouchableOpacity(
      {required this.child, required this.onTap, this.activeOpacity = 0.2});
  final Widget child;
  final Function() onTap;
  final double activeOpacity;
  @override
  _TouchableOpacityState createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  double _currentOpacity = 1.0;
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => setState(() {
        {
          _currentOpacity = widget.activeOpacity;
        }
      }),
      onPointerUp: (_) => setState(() {
        {
          _currentOpacity = 1.0;
        }
      }),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Opacity(
          opacity: _currentOpacity,
          child: widget.child,
        ),
      ),
    );
  }
}
