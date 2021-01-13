import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/commons/colors/colors.dart';
import 'package:flutter_architecture/presentation/commons/strings/error_strings.dart';
import 'package:flutter_architecture/presentation/commons/widgets/button.dart';
import 'package:flutter_architecture/presentation/commons/widgets/filed_background.dart';

class CustomErrorWidget extends StatelessWidget {

  final VoidCallback onRestartPressed;
  const CustomErrorWidget({Key key, this.onRestartPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return Stack(alignment: Alignment.center, children: [
        FieldBackground(),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(STR_ERROR_TITTLE,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
              SizedBox(height: 2),
              Text(STR_ERROR_SUBTITLE,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 16)),
              SizedBox(height: 30),
              CustomButton(STR_ERROR_RESTART, COLOR_ACCENT, Colors.white, onRestartPressed)
            ])
      ]);
  }


}