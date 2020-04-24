import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _numberOfSteps = 5;
  int _currentStep = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
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
    return _drawStep();
  }

  Widget _drawStep() {
    return Row(
      children: <Widget>[
        _drawLine(),
        _drawCircle(),
        _drawLine(),
      ],
    );
  }

  Widget _drawLine() {
    return Container(
      height: 4,
      width: 50,
      color: Colors.black,
    );
  }

  Widget _drawCircle() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
    );
  }
}
