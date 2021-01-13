import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/commons/colors/colors.dart';

class Snackbar{

  static SnackBar getSimpleSnackbar(String message){
    return new SnackBar(
      backgroundColor: COLOR_BLACK_LIGHT,
      content: Text(message, style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white)),
    );
  }

}