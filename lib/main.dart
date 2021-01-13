import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/commons/colors/colors.dart';
import 'package:flutter_architecture/presentation/commons/widgets/restart_widget.dart';
import 'package:flutter_architecture/routes.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init(); // Dependency Injection
  runApp(RestartWidget(
      child: MaterialApp(
          initialRoute: '/',
          builder: EasyLoading.init(),
          theme: ThemeData(fontFamily: 'Noto', accentColor: COLOR_ACCENT),
          onGenerateRoute: RouteGenerator.generateRoute))); // Main Page
}

