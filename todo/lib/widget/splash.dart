import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:todo/screens/home_page.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new HomePage(),
      title: new Text('TO-DO LIST'),
      image: new Image.asset('assets/splash_image.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(fontSize: 50,fontWeight: FontWeight.bold),
      photoSize: 100.0,
      loaderColor: Colors.blue,

    );
  }
}