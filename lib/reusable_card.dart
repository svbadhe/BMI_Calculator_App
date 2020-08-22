import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final int color;
  final Widget child;
  final Function onPress;
  ReusableCard({this.color, this.child, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
        child: Container(
          child: child,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(color),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
    );
  }
}

