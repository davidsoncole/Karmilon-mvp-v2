import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/forms/signup_form.dart';

void navigateToSignin(BuildContext context) {
  Navigator.of(context).pushReplacementNamed('/signin_screen');
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                    alignment: Alignment.center,
                    child: const Text(
                      'Here to get started!',
                      textAlign: TextAlign.center,
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
                        'Be part of our species and ecosystem. Join us to get started',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //     padding: EdgeInsets.fromLTRB(0, 30.0, 0, 40.0),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: <Widget>[
                  //         RaisedButton.icon(
                  //           padding: EdgeInsets.symmetric(
                  //               horizontal: 40, vertical: 10),
                  //           color: Colors.white,
                  //           icon: Icon(
                  //             Icons.add_circle_rounded,
                  //             color: Color(0xff00966B),
                  //           ),
                  //           label: Text(
                  //             'Google',
                  //             style: TextStyle(
                  //               fontSize: 16.0,
                  //               color: Color(0xff00966B),
                  //             ),
                  //           ),
                  //           onPressed: () {},
                  //         ),
                  //         RaisedButton.icon(
                  //           padding: EdgeInsets.symmetric(
                  //               horizontal: 40, vertical: 10),
                  //           color: Colors.white,
                  //           icon: Icon(
                  //             Icons.add_circle_rounded,
                  //             color: Color(0xff00966B),
                  //           ),
                  //           label: Text(
                  //             'Facebook',
                  //             style: TextStyle(
                  //               fontSize: 16.0,
                  //               color: Color(0xff00966B),
                  //             ),
                  //           ),
                  //           onPressed: () {},
                  //         ),
                  //       ],
                  //     )),
                  const SignupForm(),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                          style: TextStyle(
                              color: Colors.black,
                            ),
                          text: "I have an account? "
                        ),
                        TextSpan(
                          style: const TextStyle(
                              color: Color(0xff00966B),
                              fontWeight: FontWeight.bold,
                            ),
                          text: "login here",
                          recognizer: TapGestureRecognizer()..onTap =() {
                            Navigator.of(context).pushReplacementNamed('/signin_screen');
                          }
                        )
                      ]),
                    ),
                  )
                  // Container(
                  //   padding: EdgeInsets.only(top: 20.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text('Have an account?'),
                  //       FlatButton(
                  //         padding: EdgeInsets.symmetric(horizontal: 0),
                  //         materialTapTargetSize:
                  //             MaterialTapTargetSize.shrinkWrap,
                  //         onPressed: () => navigateToSignin(context),
                  //         child: Text(
                  //           'login here',
                  //           style: TextStyle(
                  //             color: Color(0xff00966B),
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
