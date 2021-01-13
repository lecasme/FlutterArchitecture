import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_elevation.dart';

class CustomButton extends StatelessWidget {

  final String message;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  const CustomButton(this.message, this.backgroundColor, this.textColor, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return CustomElevation(
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: backgroundColor)),
          onPressed: () => onPressed.call(),
          color: backgroundColor,
          textColor: Colors.white,
          child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(message.toUpperCase(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: textColor))),
        ),
        height: 60);
  }
}