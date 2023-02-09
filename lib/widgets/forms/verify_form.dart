import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:karmilon/providers/vet_auth.dart';
//import 'package:karmilon/models/http_exception.dart';

import 'dart:async';

class VerifyForm extends StatefulWidget {
  const VerifyForm({Key? key}) : super(key: key);

  @override
  _VerifyFormState createState() => _VerifyFormState();
}

class _VerifyFormState extends State<VerifyForm> {
  final GlobalKey<FormState> _vetformKey = GlobalKey();
  final Map<String, String> _vetData = {
    'code': '',
  };

  var _isLoading = false;

  // void _showErrorsnack(String message) {
  //   Scaffold.of(context).showSnackBar(
  //     SnackBar(
  //       backgroundColor: Colors.redAccent,
  //       content: Text(message),
  //       /*action: SnackBarAction(
  //         label: 'close',
  //         onPressed: () {
  //           Navigator.of(context).pop();
  //         },
  //       ),*/
  //     ),
  //   );
  // }

  late StreamController<ErrorAnimationType> errorController;

  bool hasError = false;

  String currentText = "";

  void _reseterror() {
    if (hasError = true) {
      setState(() {
        hasError = false;
      });
    } else {
      //return null;
    }
  }

  void _checkerror() {
    if (currentText != "") {
      errorController
          .add(ErrorAnimationType.shake); // Triggering error shake animation
      setState(() {
        hasError = !hasError;
      });
    } else {
      setState(() {
        hasError = false;
      });
    }
  }

  Future<void> _submit() async {
    if (!_vetformKey.currentState!.validate()) {
      return;
    }
    _vetformKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if(_vetData['code'] != null) {
        await Provider.of<VetAuth>(context, listen: false).verify(
          _vetData['code']!,
        );
        Navigator.of(context).pushReplacementNamed('/auth_screen');
      } else {
        throw Exception('Error');
      }
    } /*on HttpException catch (error) {
      var errorMessage = 'Your code is invalid';
      if (error.toString().contains('')) {}
      _showErrorsnack(errorMessage);
      _checkerror();
    }*/
    catch (error) {
      //var errorMessage = 'Invalid code';
      //var errorMessage = '$message';
     // _showErrorsnack(errorMessage);
      _checkerror();
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(0, 60.0, 0, 0),
          child: Form(
            key: _vetformKey,
            child: PinCodeTextField(
              backgroundColor: const Color(0xffFAF8F6),
              appContext: context,
              length: 6,
              onCompleted: (value) {
                _submit();
              },
              onChanged: (value) {
                setState(() {
                  currentText = value;
                });
                _reseterror();
              },
              onSaved: (value) {
                _vetData['code'] = value!;
              },
              /*onChanged: (value) {
                print(value);
                setState(() {
                  //currentText = value;
                });
              },*/
              beforeTextPaste: (text) {
                return true;
              },
              animationType: AnimationType.fade,
              animationDuration: const Duration(milliseconds: 300),
              errorAnimationController: errorController,
              showCursor: true,
              cursorColor: const Color(0xff00966B),
              enableActiveFill: false,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 50,
                inactiveColor: Colors.grey[300],
                activeColor: hasError ? Colors.red : const Color(0xffFAF8F6),
                //activeFillColor: hasError ? Colors.blue : Colors.red,
                activeFillColor: const Color(0xffFAF8F6),
                selectedColor: const Color(0xff00966B),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Column(
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
        )
      ],
    );
  }
}
