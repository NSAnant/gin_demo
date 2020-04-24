import 'package:flutter/material.dart';

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
    return _drawSteps();
  }

  bool _isFirst(index) {
    return index == 1;
  }

  bool _isLast(index) {
    return index == widget.numberOfSteps;
  }

  bool isCompleted(index) {
    return index < widget.currentStep;
  }

  Widget _drawSteps() {
    List<Widget> children = List<Widget>();
    for (var step = 1; step <= widget.numberOfSteps; step++) {
      children.addAll(_drawStep(step));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  List<Widget> _drawStep(index) {
    return [
      _drawLine(!_isFirst(index)),
      _drawCircle(index),
      _drawLine(!_isLast(index)),
    ];
  }

  Widget _drawLine(visible) {
    return Container(
      height: visible ? 2 : 0,
      width: 20,
      color: Colors.black,
    );
  }

  Widget _drawCircle(index) {
    return Container(
      height: 50,
      width: 50,
      child: Center(
        child: Text(
          '$index',
          style: Theme.of(context).textTheme.subhead,
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCompleted(index) ? Colors.green : Colors.white70,
        border: Border.all(
          width: 2.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
