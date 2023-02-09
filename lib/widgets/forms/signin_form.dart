import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:karmilon/providers/auth.dart';
import 'package:karmilon/models/http_exception.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({Key? key}) : super(key: key);


  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  
  bool _showPassword = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  var _isLoading = false;

  void _showErrorsnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(message),
        /*action: SnackBarAction(
          label: 'close',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),*/
      ),
    );
    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     content: Text(message),
    //   ),
    // );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if(_authData['email'] != null && _authData['password'] != null) {
        await Provider.of<Auth>(context, listen: false).signin(
          _authData['email']!,
          _authData['password']!,
        );
        Navigator.of(context).pushReplacementNamed('/auth_screen');
      } else {
        throw Exception('Error');
      }
    } on HttpException catch (message) {
      var errorMessage = '$message';
      //if (error.toString().contains('')) {}
      _showErrorsnack(errorMessage);
    } catch (error) {
      var errorMessage = 'Could not authenticate you';
      //var errorMessage = '$message';
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
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: TextFormField(
                  cursorColor: const Color(0xff00966B),
                  keyboardType: TextInputType.emailAddress,
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
                  validator: (value) {
                    if (value == null || value.isEmpty || !value.contains('@')) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['email'] = value!;
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
                    _authData['password'] = value!;
                  },
                ),
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
                            Color.fromARGB(255, 24, 39, 35),
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
                          'LOGIN',
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
