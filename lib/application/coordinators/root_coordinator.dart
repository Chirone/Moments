import 'package:flutter/widgets.dart';
import '../../data/network/network_manager.dart';
import '../../data/repositories/remote_authorization_repository.dart';
import '../../domain/usecases/authorization_usecase.dart';
import '../../presentation/splash/splash_view_builder.dart';
import '../../presentation/welcome/welcome_view.dart';
import '../../presentation/dashboard/dashboard_view.dart';

class RootCoordinator {
  final void Function(Widget) onScreenChanged;

  RootCoordinator({ required this.onScreenChanged });

  void start() {
    final networkManager = NetworkManager();
    final authRepo = RemoteAuthorizationRepository(networkManager);
    final authUseCase = AuthorizationUseCase(authRepo);

    final splash = SplashViewBuilder().build(authUseCase, this);
    onScreenChanged(splash);
  }

  void splashScreenDidEnd({ required bool authorized }) {
    if (authorized) {
      onScreenChanged(const DashboardView());
    } else {
      onScreenChanged(const WelcomeView());
    }
  }
}
