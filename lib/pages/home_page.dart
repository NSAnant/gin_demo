import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gin_app/pages/email_page.dart';
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
        leading: _currentStep > 1
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: _resetStepProgress,
              )
            : null,
        title: Text(_currentStep > 1 ? 'Create Account' : ""),
        centerTitle: false,
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
          top: 50,
          child: SingleChildScrollView(
            child: _getContentForStep(_currentStep),
          ),
        ),
      ]),
    );
  }

  Widget _getContentForStep(index) {
    switch (index) {
      case 1:
        return EmailPage(
          onStepCompletion: () {
            setState(() {
              _currentStep = 2;
            });
          },
        );
      case 2:
        return Container(
          color: Colors.green,
        );
    }
  }

  _resetStepProgress() {
    setState(() {
      _currentStep = 1;
    });
  }
}
