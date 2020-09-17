import 'package:flutter/material.dart';
import 'package:stego/pointer_model.dart';

class Confirm extends StatelessWidget {
  final List<Pointer> password;

  const Confirm({Key key, this.password});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('confirm your password'),
      ),
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Text('Pressed ${password.length} times'),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.asset('assets/pic.jpeg').image)),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  child: Text('Confirm Your password'),
                ),
              )
            ],
          ),
        ),
        for (var item in password)
          Marker(
            dx: item.x,
            dy: item.y,
          ),
      ]),
    );
  }
}

class Marker extends StatelessWidget {
  final double dx;
  final double dy;

  const Marker({this.dx, this.dy});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: dy,
      left: dx,
      child: Icon(
        Icons.location_on,
        color: Colors.red,
      ),
    );
  }
}
