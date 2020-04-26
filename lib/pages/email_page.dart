import 'package:flutter/material.dart';
import 'package:gin_app/Helper/UIHelper.dart';
import 'package:gin_app/main.dart';

class EmailPage extends StatefulWidget {
  final VoidCallback onStepCompletion;
  const EmailPage({
    Key key,
    this.onStepCompletion,
  }) : super(key: key);

  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BackgroundClipper(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
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
                    .display1
                    .apply(color: Colors.black, fontWeightDelta: 10),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Finans',
                      style: Theme.of(context).textTheme.display1.apply(
                          color: Colors.blueAccent, fontWeightDelta: 10)),
                ],
              ),
            ),
            UIHelper.smallVerticalSpace,
            Text(
              'Welcom to bank of The Future. \nManage and track your accoutns on the go.',
              style: Theme.of(context).textTheme.title,
            ),
            UIHelper.smallVerticalSpace,
            Form(
              autovalidate: true,
              key: _formKey,
              child: TextFormField(
                validator: validateEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  isDense: true,
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            UIHelper.LargeVerticalSpace,
            SizedBox(
              height: 50,
              child: RaisedButton(
                textColor: Colors.white,
                color: AppColors.bgBlue.withOpacity(0.8),
                onPressed: () {
                  // check validity and call..
                  if (_formKey.currentState.validate()) {
                    print("validated ?");
                    widget.onStepCompletion();
                  }
                },
                child: Text('Next'),
              ),
            ),
            UIHelper.LargeVerticalSpace,
          ],
        ),
      ),
    );
  }

  String validateEmail(String value) {
    if (value == null || value == "") {
      return 'Please enter email address';
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email in xx@xx.xxx format';
    else
      return null;
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width, 100);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 100);
    path.quadraticBezierTo(0, 0, 100, 20);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
