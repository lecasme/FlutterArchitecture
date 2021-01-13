import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture/presentation/commons/colors/colors.dart';
import 'package:flutter_architecture/presentation/commons/images/images.dart';

class FieldBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 3,
            child: new Stack(children: [
              Container(
                color: COLOR_BLUE_GREY_DARK,
              ),
              Positioned.fill(
                  child: Image(
                    image: IMG_CLOUD_RIGHT,
                    alignment: Alignment.bottomRight,
                  )),
            ])),
        Expanded(
          flex: 7,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    height: 7,
                    color: COLOR_GREY_BLUE_DARK)
              ],
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [COLOR_PRIMARY_LIGHT, COLOR_PRIMARY]),
            ),
          ),
        )
      ],
    );
  }
}
