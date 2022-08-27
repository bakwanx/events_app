import 'dart:async';

import 'package:events_app/constants/assets_path.dart';
import 'package:flutter/material.dart';

import '../../utils/custom_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 2), (){
      Navigator.pushNamedAndRemoveUntil(context, '/home', (context) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Event ",
              style: primaryTextStyle.copyWith(
                fontSize: 25,
                fontWeight: medium
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "App",
              style: secondaryTextStyle.copyWith(
                fontSize: 25,
                fontWeight: bold
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
