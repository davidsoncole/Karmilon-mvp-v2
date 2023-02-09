import 'package:flutter/material.dart';

class WithdrawalForm extends StatefulWidget {
  @override
  _WithdrawalFormState createState() => _WithdrawalFormState();
}

class _WithdrawalFormState extends State<WithdrawalForm> {
  void navigateToWithdrawal(BuildContext context) {
    Navigator.of(context).pushNamed('/withdrawal_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: TextField(
              cursorColor: Color(0xff00966B),
              decoration: InputDecoration(
                labelText: 'Amount',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff00966B), width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 30.0, 0, 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 10.0),
                  child: OutlineButton(
                      borderSide: BorderSide(color: Color(0xff00966B)),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      onPressed: () {},
                      child: Text(
                        'CANCEL',
                        style: TextStyle(
                          color: Color(0xff00966B),
                        ),
                      )),
                ),
                Container(
                  child: FlatButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      color: Color(0xff00966B),
                      onPressed: () => navigateToWithdrawal(context),
                      child: Text(
                        'CONTINUE',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
