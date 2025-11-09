import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../application/coordinators/root_coordinator.dart';
import 'presentation/splash/splash_view_builder.dart';
import 'presentation/welcome/welcome_view.dart';
import 'presentation/dashboard/dashboard_view.dart';

void main() {
  runApp(const MomentsApp());
}

class MomentsApp extends StatelessWidget {
  const MomentsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootView(),
    );
  }
}

class RootView extends StatefulWidget {
  const RootView({super.key});
  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  late RootCoordinator _coordinator;
  late Widget _currentScreen;

  @override
  void initState() {
    super.initState();
    _coordinator = RootCoordinator(onScreenChanged: _onScreenChanged);
    _coordinator.start();
  }

  void _onScreenChanged(Widget screen) {
    setState(() {
      _currentScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        // Since canPop=false, didPop should be false: user attempted back
        SystemNavigator.pop();
      },
      child: _currentScreen,
    );
  }
}
