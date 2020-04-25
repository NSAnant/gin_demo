import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gin_app/Helper/UIHelper.dart';
import 'package:gin_app/main.dart';
import 'package:gin_app/wigets/custom_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _numberOfSteps = 4;
  int _currentStep = 2;
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
          top: 100,
          child: SingleChildScrollView(
            child: _getContentForStep(0),
          ),
        ),
      ]),
    );
  }

  Widget _getContentForStep(index) {
    return _emailWidget();
  }

  Widget _emailWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration:
          BoxDecoration(color: AppColors.bgWhite, shape: BoxShape.rectangle),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          UIHelper.LargeVerticalSpace,
          RichText(
            text: TextSpan(
              text: "Welcome to \nGIN ",
              style: Theme.of(context)
                  .textTheme
                  .display3
                  .apply(color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: 'Finans',
                    style: Theme.of(context)
                        .textTheme
                        .display3
                        .apply(color: Colors.blueAccent)),
              ],
            ),
          ),
          UIHelper.smallVerticalSpace,
          Text(
            'Welcom to bank of The Future. \nManage and track your accoutns on the go.',
            style: Theme.of(context).textTheme.title,
          ),
          UIHelper.smallVerticalSpace,
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Email",
              isDense: true,
              prefixIcon: Icon(Icons.email),
            ),
          ),
          UIHelper.LargeVerticalSpace,
          SizedBox(
            height: 50,
            child: RaisedButton(
              textColor: Colors.white,
              color: AppColors.bgBlue.withOpacity(0.8),
              onPressed: () {},
              child: Text('Next'),
            ),
          ),
          UIHelper.LargeVerticalSpace,
        ],
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
//    path.lineTo(0, size.height);
//    path.lineTo(size.height, size.height);
//    path.lineTo(size.height, 0);
//    path.cubicTo(size.width / 4, 3 * size.height / 4, 3 * size.width / 4,
//        size.height / 4, size.width, size.height);

//    path.moveTo(0, 100);
    path.cubicTo(0, size.width, 0, 50, 100, size.width);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
