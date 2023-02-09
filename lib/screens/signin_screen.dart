import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:karmilon/widgets/forms/signin_form.dart';
import 'package:karmilon/modals/reset_pwd.dart';

void navigateToSignup(BuildContext context) {
  Navigator.of(context).pushReplacementNamed('/signup_screen');
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);


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
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 150,
                    padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                    child: Image.asset(
                      'assets/karmilon-logo6.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Here to get welcomed!',
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
                        'The world is dynamic and so are we. Welcome to Karmilon',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
                  const SigninForm(),
                  Theme(
                    data: Theme.of(context)
                        .copyWith(canvasColor: Colors.transparent),
                    child: const Resetpwd(),
                  ),
                  // Container(
                  //   padding: EdgeInsets.only(top: 20.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text('Don’t have an account?'),
                  //       TextButton(
                  //         onPressed: () => navigateToSignup(context),
                  //         child: Text(
                  //           'Register today',
                  //           style: TextStyle(
                  //             color: Color(0xff00966B),
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                          style: TextStyle(
                              color: Colors.black,
                            ),
                          text: "Don't have an account? "
                        ),
                        TextSpan(
                          style: const TextStyle(
                              color: Color(0xff00966B),
                              fontWeight: FontWeight.bold,
                            ),
                          text: "Register today",
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.of(context).pushReplacementNamed('/signup_screen');
                          }
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
