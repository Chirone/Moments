import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_bloc.dart';
import 'splash_state.dart';
import '../../application/coordinators/root_coordinator.dart';

class SplashView extends StatefulWidget {
  final RootCoordinator coordinator;
  const SplashView({ Key? key, required this.coordinator }) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is SplashAuthorized) {
              widget.coordinator.splashScreenDidEnd(authorized: true);
            } else if (state is SplashUnauthorized) {
              widget.coordinator.splashScreenDidEnd(authorized: false);
            } else if (state is SplashError) {
              // You might show error UI or still move on
              widget.coordinator.splashScreenDidEnd(authorized: false);
            }
          },
          child: const Text('Splash Screen'),
        ),
      ),
    );
  }
}
