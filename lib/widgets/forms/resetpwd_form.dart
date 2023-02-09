import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:karmilon/providers/reset_auth.dart';
import 'package:karmilon/models/http_exception.dart';

class ResetpwdForm extends StatefulWidget {
  const ResetpwdForm({Key? key}) : super(key: key);

  @override
  _ResetpwdFormState createState() => _ResetpwdFormState();
}

class _ResetpwdFormState extends State<ResetpwdForm> {
  final GlobalKey<FormState> _resetPwdKey = GlobalKey();
  final Map<String, String> _resetPassword = {
    'email': '',
  };

  var _isLoading = false;


  _showModalBottomSheet(context) {
    showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
        height: 250,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 100,
                  padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 10.0),
                  child: Image.asset(
                    'assets/verify-open-mail-icon.png',
                    fit: BoxFit.fitHeight,
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: const Text(
                  'Reset password sent',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xff00966B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                'Please check your registered mail and follow the instructions to getting back access to your account.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Future<void> _submit() async {
    print('reset started');
    if (!_resetPwdKey.currentState!.validate()) {
      return;
    }
    _resetPwdKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<ResetAuth>(context, listen: false).pwdreset(
        _resetPassword['email']!,
      );
        _showModalBottomSheet(context);
    } on HttpException catch (error) {
      var errorMessage = 'Password reset failed';
      if (error.toString().contains('')) {}
      // _showErrorsnack(errorMessage);
    } catch (error /*message*/) {
      var errorMessage = 'Something went wrong, retry in a litte bit';
      //var errorMessage = '$message';
      // _showErrorsnack(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _resetPwdKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
            child: TextFormField(
              cursorColor: const Color(0xff00966B),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.markunread_outlined),
                labelText: 'Enter email address',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff00966B), width: 1.5),
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
                _resetPassword['email'] = value!;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: OutlineButton(
                    borderSide: const BorderSide(color: Color(0xff00966B)),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    onPressed: () {},
                    child: const Text(
                      'CANCEL',
                      style: TextStyle(
                        color: Color(0xff00966B),
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
                      FlatButton(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                        color: const Color(0xff00966B),
                        onPressed: _submit,
                        child: const Text(
                          'RESET',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
