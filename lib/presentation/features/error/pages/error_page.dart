
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/commons/widgets/restart_widget.dart';
import 'package:flutter_architecture/presentation/features/error/bloc/error_bloc.dart';
import 'package:flutter_architecture/presentation/features/error/widgets/error_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';

class ErrorPage extends StatefulWidget {
  ErrorPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ErrorPageState();
  }
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBody(context));
  }

  final errorhBloc = sl<ErrorBloc>();

  BlocProvider<ErrorBloc> buildBody(BuildContext context) {
    return BlocProvider(create: (_) => errorhBloc, child: createListener());
  }

  /// BlocListener widget in order to DO THINGS in response to state changes in our DataBloc
  BlocListener<ErrorBloc, ErrorState> createListener() {
    return BlocListener<ErrorBloc, ErrorState>(
        listener: (context, state) {
          if (state is ErrorRestart) {
            RestartWidget.restartApp(context);
          }
        },
        child: createBuilder());
  }

  /// BlocBuilder widget in order to RENDER WIDGETS in response to state changes in our DataBloc
  BlocBuilder<ErrorBloc, ErrorState> createBuilder() {
    return BlocBuilder<ErrorBloc, ErrorState>(
      builder: (context, state) {
        return CustomErrorWidget(onRestartPressed: _restartApplication);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    errorhBloc.close();
  }

  void _restartApplication() {
    errorhBloc.add(ApplicationRestart());
  }
}
