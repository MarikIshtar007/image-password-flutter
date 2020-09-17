import 'package:flutter/material.dart';
import 'package:stego/confirm.dart';
import 'package:stego/pointer_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool done = false;
  List<Pointer> password = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Password'),
        ),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Text('Pressed ${password.length} times'),
            ),
            Flexible(
                flex: 3,
                child: GestureDetector(
                  onPanDown: (details) {
                    password.add(Pointer(
                        x: details.localPosition.dx.floorToDouble(),
                        y: details.localPosition.dy.floorToDouble()));
                    setState(() {
                      if (password.length >= 3) {
                        done = true;
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: Image.asset('assets/pic.jpeg').image)),
                  ),
                )),
            Flexible(
              flex: 1,
              child: Container(
                child: RaisedButton(
                  color: Colors.lightBlueAccent,
                  child: Text('Confirm Your password'),
                  onPressed: done
                      ? () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Confirm(
                                        password: password,
                                      )));
                        }
                      : null,
                ),
              ),
            )
          ],
        ));
  }
}
