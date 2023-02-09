import 'package:flutter/material.dart';

void navigateToScreen(BuildContext context) {
  Navigator.of(context).pushReplacementNamed('/tab_screen');
}

class VerifiedScreen extends StatelessWidget {
  const VerifiedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(40.0, 50.0, 40.0, 0),
              //color: Colors.grey[400],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                      height: 150,
                      padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                      child: Image.asset(
                        'assets/karmilon-logo6.png',
                        fit: BoxFit.fitHeight,
                      )),
                  Container(
                      height: 130,
                      padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
                      child: Image.asset(
                        'assets/verified-mail-icon.png',
                        fit: BoxFit.fitHeight,
                      )),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Email verified',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 20.0),
                    child: const Center(
                      child: Text(
                        'Your email was verified successfully',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 20.0),
                    child: Center(
                      child: FlatButton(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          onPressed: () => navigateToScreen(context),
                          child: const Text('continue')),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
