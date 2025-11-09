import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/authorization_usecase.dart';
import 'splash_bloc.dart';
import 'splash_event.dart';
import 'splash_view.dart';
import '../../application/coordinators/root_coordinator.dart';

class SplashViewBuilder {
  Widget build(
      AuthorizationUseCase authorizationUseCase,
      RootCoordinator coordinator,
      ) {
    return BlocProvider(
      create: (_) => SplashBloc(authorizationUseCase)..add(SplashStarted()),
      child: SplashView(coordinator: coordinator),
    );
  }
}
