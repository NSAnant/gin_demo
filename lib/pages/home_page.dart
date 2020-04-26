import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gin_app/Helper/UIHelper.dart';
import 'package:gin_app/main.dart';
import 'package:gin_app/pages/email_page.dart';
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
        return password_page(
          onStepCompletion: () {
            setState(() {
              _currentStep = 3;
            });
          },
        );
    }
  }

  _resetStepProgress() {
    setState(() {
      _currentStep = 1;
    });
  }
}

class password_page extends StatefulWidget {
  final VoidCallback onStepCompletion;
  const password_page({
    Key key,
    this.onStepCompletion,
  }) : super(key: key);

  @override
  _password_pageState createState() => _password_pageState();
}

class _password_pageState extends State<password_page> {
  bool passwordVisible = false;
  bool hasSmallcase = false;
  bool hasLargecase = false;
  bool hasNumber = false;
  bool hasMoreThan9 = false;
  @override
  void initState() {
    passwordVisible = false;
  }

  TextEditingController passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Create Password",
            style: Theme.of(context).textTheme.title.apply(
                  color: Colors.white,
                ),
          ),
          UIHelper.smallVerticalSpace,
          Text(
            "Password will be used to login to account",
            style:
                Theme.of(context).textTheme.subtitle.apply(color: Colors.white),
          ),
          UIHelper.smallVerticalSpace,
          TextField(
            onChanged: _passwordValidator,
            obscureText: !passwordVisible,
            controller: passwordTextController,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              labelText: 'Create Password',
              filled: true,
              hasFloatingPlaceholder: false,
              suffixIcon: IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  passwordVisible ? Icons.visibility_off : Icons.visibility,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
            ),
          ),
          UIHelper.smallVerticalSpace,
          Text(
            'Complexity : $complexity',
            style: Theme.of(context).textTheme.body1.apply(color: Colors.white),
          ),
          UIHelper.smallVerticalSpace,
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    hasSmallcase
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : Text(
                            'a',
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .apply(color: Colors.white),
                          ),
                    UIHelper.smallVerticalSpace,
                    Text(
                      'Lowercase',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .apply(color: Colors.white),
                    ),
                  ],
                ),
                UIHelper.smallHorizontalSpace,
                Column(
                  children: <Widget>[
                    hasLargecase
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : Text(
                            'A',
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .apply(color: Colors.white),
                          ),
                    UIHelper.smallVerticalSpace,
                    Text(
                      'Uppercase',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .apply(color: Colors.white),
                    ),
                  ],
                ),
                UIHelper.smallHorizontalSpace,
                Column(
                  children: <Widget>[
                    hasNumber
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : Text(
                            '123',
                            style: Theme.of(context).textTheme.display1.apply(
                                color: hasNumber ? Colors.green : Colors.white),
                          ),
                    UIHelper.smallVerticalSpace,
                    Text(
                      'Number',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .apply(color: Colors.white),
                    ),
                  ],
                ),
                UIHelper.smallHorizontalSpace,
                Column(
                  children: <Widget>[
                    hasMoreThan9
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : Text(
                            '9+',
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .apply(color: Colors.white),
                          ),
                    UIHelper.smallVerticalSpace,
                    Text(
                      'Characters',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .apply(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: RaisedButton(
              textColor: Colors.white,
              color: AppColors.bgWhite.withOpacity(0.4),
              onPressed: () {
                // check validity and call..
                widget.onStepCompletion();
              },
              child: Text('Next'),
            ),
          ),
        ],
      ),
    );
  }

  _passwordValidator(String value) {
    print(value);
    setState(() {
      hasSmallcase = _hasSmallCase(value);
      hasLargecase = _hasLargeCase(value);
      hasNumber = _hasNumbers(value);
      hasMoreThan9 = _isLengthMoreThan9(value);
    });
  }

  String get complexity {
    int complexity = (hasSmallcase ? 1 : 0) +
        (hasLargecase ? 1 : 0) +
        (hasNumber ? 1 : 0) +
        (hasMoreThan9 ? 1 : 0);
    var str = "";
    switch (complexity) {
      case 4:
        str = "Strong";
        break;
      case 3:
        str = "Medium";
        break;
      case 2:
        str = "Weak";
        break;
      case 1:
        str = "Weak";
        break;
      case 0:
        str = "";
        break;
    }
    return str;
  }

  bool _hasSmallCase(String value) {
    print(value);
    if (value == null || value == "") {
      return false;
    }
    Pattern pattern = r'[a-z]';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }

  bool _hasLargeCase(String value) {
    print(value);
    if (value == null || value == "") {
      return false;
    }
    Pattern pattern = r'[A-Z]';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }

  bool _hasNumbers(String value) {
    print(value);
    if (value == null || value == "") {
      return false;
    }
    Pattern pattern = r'[0-9]';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }

  bool _isLengthMoreThan9(String value) {
    return value.length >= 9;
  }
}
