import 'package:flutter/material.dart';

/*void navigateToSignin(BuildContext context) {
  Navigator.of(context).pushNamed('/');
}*/

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/signin_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff00966B),
        body: Container(
          decoration: const BoxDecoration(
              /*image: DecorationImage(
              image: AssetImage("assets/splash_bgg.png"),
              fit: BoxFit.cover,
            ),*/
              ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
                  child: Image.asset(
                    'assets/karmilo-logo8.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(
                  width: 100,
                  child: LinearProgressIndicator(
                    valueColor:  AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
