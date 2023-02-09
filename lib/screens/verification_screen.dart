import 'package:flutter/material.dart';
import 'package:karmilon/widgets/forms/verify_form.dart';

import 'package:provider/provider.dart';
import 'package:karmilon/providers/vet_auth.dart';
import 'package:karmilon/models/http_exception.dart';
import 'package:karmilon/providers/auth.dart';

import 'dart:async';

void navigateToVerified(BuildContext context) {
  Navigator.of(context).pushReplacementNamed('/verified_screen');
}

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  var _isLoading = false;

  bool isVisible = true;
  bool notVisible = false;

  void _showErrorsnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(message),
      ),
    );
  }

  // void _showSuccesssnack() {
  //   Scaffold.of(context).showSnackBar(
  //     SnackBar(
  //       backgroundColor: Colors.greenAccent,
  //       content: Text('A new verification code was sent!'),
  //       /*action: SnackBarAction(
  //         label: 'close',
  //         onPressed: () {
  //           Navigator.of(context).pop();
  //         },
  //       ),*/
  //     ),
  //   );
  // }

  // Timer _timer;
  // int _start = 30;

  // void _startTimer() {
  //   const oneSec = const Duration(seconds: 1);
  //   _timer = new Timer.periodic(
  //     oneSec,
  //     (Timer timer) {
  //       if (_start == 0) {
  //         setState(() {
  //           timer.cancel();
  //           notVisible = false;
  //           isVisible = true;
  //         });
  //       } else {
  //         setState(() {
  //           _start--;
  //         });
  //       }
  //     },
  //   );
  // }

  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }

  Future<void> _submit() async {
    
    setState(() {
      _isLoading = true;
      isVisible = false;
      notVisible = false;
    });
    try {
      await Provider.of<VetAuth>(context, listen: false).resendCode();
      setState(() {
        notVisible = true;
      });
    } on HttpException catch (message) {
      var errorMessage = '$message';
      //if (error.toString().contains('')) {}
      _showErrorsnack(errorMessage);
    }
    catch (error, message) {
      var errorMessage = 'An error occured, Please try again';
      //var errorMessage = '$message';
      _showErrorsnack(errorMessage);
    }
    setState(() {
      _isLoading = false;
      isVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context);
    return Scaffold(
      backgroundColor: const Color(0xffFAF8F6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(40.0, 50.0, 40.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                      height: 150,
                      padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                      child: Image.asset(
                        'assets/verify-mail-icon.png',
                        fit: BoxFit.fitHeight,
                      )),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Verification',
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
                        'Enter the code we just sent to your email address',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  VerifyForm(),
                  Visibility(
                    visible: isVisible,
                    child: const Center(
                      child: Text('You didn’t receive a code?'),
                    ),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 10.0),
                      child: FlatButton(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        onPressed: () {
                          _submit();
                        },
                        child: const Text(
                          'RESEND',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xff00966B),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      if (_isLoading)
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.grey.shade200,
                            valueColor: const AlwaysStoppedAnimation(
                              Color(0xff00966B),
                            ),
                          ),
                        )
                      else
                        const SizedBox(
                          height: 20,
                        ),
                    ],
                  ),
                  // Visibility(
                  //   visible: notVisible,
                  //   child: Container(
                  //     margin: EdgeInsets.symmetric(
                  //       horizontal: 20,
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //           padding: EdgeInsets.fromLTRB(0, 5.0, 0, 10.0),
                  //           child: Text(
                  //             'RESEND',
                  //             style: TextStyle(
                  //               fontSize: 14.0,
                  //             ),
                  //           ),
                  //         ),
                  //         Container(
                  //           padding: EdgeInsets.fromLTRB(0, 5.0, 0, 10.0),
                  //           margin: EdgeInsets.only(
                  //             left: 10,
                  //           ),
                  //           child: Text(
                  //             '($_start : 00)',
                  //             style: TextStyle(
                  //               fontSize: 14.0,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Visibility(
                    visible: notVisible,
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            'Code was sent to',
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            user.userEmail,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
