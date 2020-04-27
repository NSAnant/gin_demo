import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gin_app/pages/email_page.dart';
import 'package:gin_app/pages/info_page.dart';
import 'package:gin_app/pages/password_page.dart';
import 'package:gin_app/pages/video_call_page.dart';
import 'package:gin_app/wigets/custom_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _numberOfSteps = 4;
  int _currentStep = 4;
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
        return Password_page(
          onStepCompletion: () {
            setState(() {
              _currentStep = 3;
            });
          },
        );
      case 3:
        return Info_page(onStepCompletion: () {
          setState(() {
            _currentStep = 4;
          });
        });
      case 4:
        return Video_Page();
    }
  }

  _resetStepProgress() {
    setState(() {
      _currentStep = 1;
    });
  }
}
