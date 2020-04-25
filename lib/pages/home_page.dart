import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gin_app/wigets/custom_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _numberOfSteps = 4;
  int _currentStep = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Stack(children: <Widget>[
        Container(
          color: Theme.of(context).primaryColor,
        ),
        CustomStepper(
          numberOfSteps: _numberOfSteps,
          currentStep: _currentStep,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          top: 100,
          child: ClipPath(
            clipper: BackgroundClipper(),
            child: Container(
              decoration:
                  BoxDecoration(color: Colors.grey, shape: BoxShape.rectangle),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Center(),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var controllPoint = Offset(50, size.width);
    var endPoint = Offset(size.height / 2, size.width);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
