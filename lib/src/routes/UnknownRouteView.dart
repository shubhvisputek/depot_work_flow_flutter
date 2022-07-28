//F7F8F9

import 'package:flutter/material.dart';

class UnknownRouteView extends StatelessWidget {
  UnknownRouteView({Key? key}) : super(key: key);

  static const routeName = '/notfound';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "404",
                  style: TextStyle(
                    color: Color(0xff00518D),
                    fontSize: 40.0,
                  ),
                ),
                const Text(
                  "Sorry, we couldn't find that page...",
                  style: TextStyle(
                    color: Color(0xff414141),
                    fontSize: 20.0,
                  ),
                ),
                Image.asset(
                  'assets/images/bird_image.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
