import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text('Welcome to Moments App!'),
          ),
        ],
      ),
    );
  }
}
