import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_architecture/presentation/commons/widgets/snackbar.dart';
import 'package:flutter_architecture/presentation/features/splash/bloc/splash_bloc.dart';
import 'package:flutter_architecture/presentation/features/splash/widgets/splash_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context)
    );
  }

  final splashBloc = sl<SplashBloc>();

  BlocProvider<SplashBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => splashBloc,
      child: createListener()
    );
  }

  /// BlocListener widget in order to DO THINGS in response to state changes in our DataBloc
  BlocListener<SplashBloc, SplashState> createListener() {
    return BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashLoaded) {
            Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
          } else if (state is SplashError) {
            Navigator.of(context).pushNamed('/error');
          }
        },
        child: createBuilder());
  }

  /// BlocBuilder widget in order to RENDER WIDGETS in response to state changes in our DataBloc
  BlocBuilder<SplashBloc, SplashState> createBuilder() {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          if (state is SplashInitial) {
            _loadPokemons();
          } else if (state is SplashOffline) {
            Scaffold.of(context).showSnackBar(Snackbar.getSimpleSnackbar(state.message));
          }
        });
        return SplashWidget();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    splashBloc.close();
  }

  void _loadPokemons() {
    splashBloc.add(LoadPokemons());
  }
}
