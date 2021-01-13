import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/commons/colors/colors.dart';
import 'package:flutter_architecture/presentation/commons/images/images.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Image(
              width: 200,
              height: 100,
              image: IMG_LOGO),
        );
  }
}
