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
        Center(
          child: Column(
            children: <Widget>[
              Center(
                child: CustomStepper(
                  numberOfSteps: _numberOfSteps,
                  currentStep: _currentStep,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
