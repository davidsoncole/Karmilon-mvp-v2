import 'package:flutter/material.dart';
import 'package:karmilon/widgets/forms/resetpwd_form.dart';

class Resetpwd extends StatelessWidget {
  const Resetpwd({Key? key}) : super(key: key);

  _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              height: 300,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20.0, 0, 30.0),
                    child: const Text(
                      'Forget password',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const ResetpwdForm(),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: () {
        _showModalBottomSheet(context);
      },
      child: const Text(
        'Forget password?',
        style: TextStyle(
          color: Color(0xff00966B),
        ),
      ),
    );
  }
}
