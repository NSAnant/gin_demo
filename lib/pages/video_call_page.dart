import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gin_app/Helper/UIHelper.dart';
import 'package:gin_app/main.dart';

class Video_Page extends StatefulWidget {
  final VoidCallback onStepCompletion;
  const Video_Page({Key key, this.onStepCompletion}) : super(key: key);
  @override
  _Video_PageState createState() => _Video_PageState();
}

class _Video_PageState extends State<Video_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: IconButton(
              icon: Icon(
                Icons.date_range,
                color: AppColors.bgBlue,
              ),
              onPressed: () {},
            ),
          ),
          UIHelper.MediumVerticalSpace,
          Text(
            'Schedule Video Call',
            style: Theme.of(context).textTheme.title.apply(color: Colors.white),
          ),
          UIHelper.verySmallVerticalSpace,
          Text(
            'Choose the date and time that you preferred. we will send a link via email to make a video call on the scheduled date and time',
            style: Theme.of(context).textTheme.body1.apply(color: Colors.white),
          ),
          UIHelper.MediumVerticalSpace,
          SizedBox(
            height: 50,
            width: double.infinity,
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
}
