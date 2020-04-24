import 'package:flutter/material.dart';

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
      body: Column(
        children: <Widget>[
          Center(
            child: CustomStepper(
              numberOfSteps: _numberOfSteps,
              currentStep: _currentStep,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomStepper extends StatefulWidget {
  final int numberOfSteps;
  int currentStep;

  CustomStepper({Key key, this.numberOfSteps, this.currentStep})
      : super(key: key);

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return _drawSteps();
  }

  Widget _drawSteps() {
    List<Widget> children = List<Widget>();
    for (var step = 1; step <= widget.numberOfSteps; step++) {
      children.addAll(_drawStep(step));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  List<Widget> _drawStep(index) {
    return [
      _drawLine(),
      _drawCircle(index),
      _drawLine(),
    ];
  }

  Widget _drawLine() {
    return Container(
      height: 4,
      width: 20,
      color: Colors.black,
    );
  }

  Widget _drawCircle(index) {
    return Container(
      height: 50,
      width: 50,
      child: Center(
        child: Text('$index'),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white30,
        border: Border.all(
          width: 3.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
