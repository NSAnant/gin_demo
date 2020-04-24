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
          Expanded(
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
    return _drawCircle();
  }

  Widget _drawCircle() {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
    );
  }
}
