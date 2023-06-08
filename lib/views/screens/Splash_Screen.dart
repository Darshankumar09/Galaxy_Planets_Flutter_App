import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.of(context).pushReplacementNamed('home_page');
      },
    );

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/sun.png',
              height: 30.h,
              width: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
