import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:karmilon/providers/auth.dart';
import 'package:karmilon/models/http_exception.dart';

// import 'package:url_launcher/url_launcher.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool _showPassword = false;
  final GlobalKey<FormState> _regformKey = GlobalKey();
  final Map<String, String> _regData = {
    'firstname': '',
    'lastname': '',
    'email': '',
    'phone': '',
    'password': '',
  };

  var _isLoading = false;

  void _showErrorsnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        /*action: SnackBarAction(
          label: 'close',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),*/
      ),
    );
    /*showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
      ),
    );*/
  }

  Future<void> _submit() async {
    if (!_regformKey.currentState!.validate()) {
      //invalid
      return;
    }

    _regformKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false).signup(
        _regData['firstname']!,
        _regData['lastname']!,
        _regData['email']!,
        _regData['phone']!,
        _regData['password']!,
      );
      Navigator.of(context).pushReplacementNamed('/verification_screen');
    } on HttpException catch (message) {
      var errorMessage = '$message';
      //if (error.toString().contains('')) {}
      _showErrorsnack(errorMessage);
    } catch (error) {
      //var errorMessage = '$error';
      var errorMessage = 'Could not authenticate you';
      _showErrorsnack(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _regformKey,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: TextFormField(
                  cursorColor: const Color(0xff00966B),
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.person_outline),
                    labelText: 'First Name',
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff00966B), width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _regData['firstname'] = value!;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: TextFormField(
                  cursorColor: const Color(0xff00966B),
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.person_outline),
                    labelText: 'Last Name',
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff00966B), width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _regData['lastname'] = value!;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: TextFormField(
                  cursorColor: const Color(0xff00966B),
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.markunread_outlined),
                    labelText: 'Email',
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff00966B), width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _regData['email'] = value!;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: TextFormField(
                  cursorColor: const Color(0xff00966B),
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.call_outlined),
                    hintText: 'Eg. 0803492XXX0',
                    labelText: 'Phone Number',
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff00966B), width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _regData['phone'] = value!;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: TextFormField(
                  obscureText: !_showPassword,
                  cursorColor: const Color(0xff00966B),
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      child: Icon(
                        _showPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                    labelText: 'Password',
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff00966B), width: 1.5),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return 'Password is to Short';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _regData['password'] = value!;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                        ),
                      text: "By clicking sign up you are agreeing to our "
                    ),
                    TextSpan(
                      style: const TextStyle(
                          color: Color(0xff00966B),
                          fontWeight: FontWeight.bold,
                        ),
                      text: "terms of use",
                      recognizer: TapGestureRecognizer()..onTap = () async {
                        // var url = "https://karmilon.com";
                        // if(await canLaunch(url)){
                        //   await launch(url);
                        // } else{
                        //   print('can not open');
                        //   //throw "Can not load url";
                        // }
                      }
                    )
                  ]),
                ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 10.0),
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
                      FlatButton(
                        minWidth: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        color: const Color(0xff00966B),
                        onPressed: _submit,
                        child: const Text(
                          'SIGNUP',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
