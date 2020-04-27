import 'package:flutter/material.dart';
import 'package:gin_app/Helper/UIHelper.dart';
import 'package:gin_app/main.dart';

class Info_page extends StatefulWidget {
  final VoidCallback onStepCompletion;

  const Info_page({Key key, this.onStepCompletion}) : super(key: key);
  @override
  _Info_pageState createState() => _Info_pageState();
}

class _Info_pageState extends State<Info_page> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String activationReason;
  String income;
  String exp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DropdownButtonFormField(
              validator: (value) {
                return value == null
                    ? "Please Select Goal for activation"
                    : null;
              },
              isDense: true,
              decoration: InputDecoration(
                hintText: 'hint Text',
                labelText: 'Goal for activation',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  gapPadding: 0,
                ),
                contentPadding: EdgeInsets.all(5),
                fillColor: Colors.white,
                filled: true,
              ),
              items: [
                "- Choose Option -",
                "Marriage",
                "House",
                "Car",
                "Bike",
                "Traval"
              ].map((value) {
                return DropdownMenuItem<String>(
                  child: Text('$value'),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  activationReason = value;
                });
              },
              value: activationReason,
            ),
            UIHelper.smallVerticalSpace,
            DropdownButtonFormField(
              validator: (value) {
                return value == null ? "Please Select Monthly Income" : null;
              },
              isDense: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    gapPadding: 0,
                  ),
                  contentPadding: EdgeInsets.all(5),
                  hasFloatingPlaceholder: false,
                  labelText: 'Monthly Income',
                  fillColor: Colors.white,
                  filled: true),
              items: [
                "- Choose Option -",
                "1000 - 5,000",
                "5000 - 10,000",
                "10,000 - 20,000",
                "20,000 - 30,000",
                "30,000 - 50,000",
                "50,000 - 1,00,000",
                "more than 1,00,000",
              ].map((value) {
                return DropdownMenuItem<String>(
                  child: Text('$value'),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  income = value;
                });
              },
              value: income,
            ),
            UIHelper.smallVerticalSpace,
            DropdownButtonFormField(
              validator: (value) {
                return value == null ? "Please Select Monthly Expences" : null;
              },
              isDense: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    gapPadding: 0,
                  ),
                  contentPadding: EdgeInsets.all(5),
                  hintText: 'Monthly Expences',
                  hasFloatingPlaceholder: false,
                  labelText: 'Monthly Expences',
                  fillColor: Colors.white,
                  filled: true),
              items: [
                "- Choose Option -",
                "300 - 1,000",
                "1000 - 5000",
                "5,000 - 10,000",
                "10,000 - 20,000",
                "20,000 - 30,000",
                "30,000 - 50,000",
                "50,000 - 1,00,000",
                "more than 1,00,000",
              ].map((value) {
                return DropdownMenuItem<String>(
                  child: Text('$value'),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  exp = value;
                });
              },
              value: exp,
            ),
            UIHelper.smallVerticalSpace,
            SizedBox(
              height: 50,
              child: RaisedButton(
                textColor: Colors.white,
                color: AppColors.bgWhite.withOpacity(0.4),
                onPressed: () {
                  // check validity and call..
                  if (_formKey.currentState.validate()) {
                    widget.onStepCompletion();
                  }
                },
                child: Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
