import 'dart:async';

import 'package:flutter/material.dart';

import 'package:depotworkflow/src/login/login_view.dart';
import 'splash_controller.dart';

class SplashView extends StatefulWidget {

  static const routeName = '/splash';

  @override
  _SplashViewState createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    LoginView()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          width: 256.0,
          height: 256.0,
          image: AssetImage(
            'assets/images/process_logo.png',
          ),
        ),
      ),
    );
  }
}