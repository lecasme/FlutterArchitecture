import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/commons/colors/colors.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(COLOR_PRIMARY_LIGHT),
        strokeWidth: 5.0
    );
  }

  static void showLoading(){
    EasyLoading.show(maskType: EasyLoadingMaskType.black, indicator: LoadingWidget());
  }

  static void hideLoading(){
    EasyLoading.dismiss();
  }

}
