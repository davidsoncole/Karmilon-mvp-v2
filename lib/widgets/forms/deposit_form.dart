import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:karmilon/providers/flutterwave.dart';
import 'package:provider/provider.dart';

class DepositForm extends StatefulWidget {
  const DepositForm({Key? key}) : super(key: key);

  @override
  _DepositFormState createState() => _DepositFormState();
}

class _DepositFormState extends State<DepositForm> {
  final GlobalKey<FormState> _depositformKey = GlobalKey();
  final Map<String, String> _depositData = {
    'amount': '',
  };

  var _isLoading = false;

  String? _ref;
  void setRef() {
    Random rand = Random();
    int numb = rand.nextInt(500000000);
    if(Platform.isAndroid) {
      setState(() {
        _ref = "KarmiAndroidRef001$numb";
      });
    } else {
      setState(() {
        _ref = "KarmiIOSRef001$numb";
      });
    }
  }

  // flutterwave deposit
  Future<void> _submit() async {
    print("this stated");
    setRef();
    if (!_depositformKey.currentState!.validate()) {
      return;
    }
    _depositformKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Flutterwave>(context, listen: false).waveDeposit(
        _depositData['amount']!,
        _ref!,
      );
    
    } on HttpException catch (message) {
      // var errorMessage = '$message';
      //if (error.toString().contains('')) {}
      // _showErrorsnack(errorMessage);
    } catch (error) {
      // var errorMessage = 'Could not authenticate you';
      //var errorMessage = '$message';
      // _showErrorsnack(errorMessage);
    }
    // setState(() {
    //   _isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _depositformKey,
      child: Column(
        children: [
          TextFormField(
            cursorColor: const Color(0xff00966B),
            decoration: const InputDecoration(
              labelText: 'Amount',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff00966B), width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.5),
              ),
            ),
            validator: (value) {
              if (value == null) {
                return 'Please enter an amount';
              }
              return null;
            },
            onSaved: (value) {
              _depositData['amount'] = value!;
            },
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
                      )),
                ),
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
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    color: const Color(0xff00966B),
                    onPressed: () {
                      _submit();
                      // Navigator.of(context).pushNamed('/deposit_screen');
                    },
                    child: const Text(
                      'CONTINUE',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
