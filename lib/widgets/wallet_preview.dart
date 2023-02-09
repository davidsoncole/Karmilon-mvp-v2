import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:karmilon/providers/get_auth.dart';

/*void navigateToSignin(BuildContext context) {
  Navigator.of(context).pushNamed('/');
}*/

class WalletPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<GetAuth>(context);
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              margin: EdgeInsets.only(right: 5.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg-img4.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'WALLET',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Container(
                          height: 30.0,
                          width: 30.0,
                          color: Color(0xffFAF3ED),
                          child: Icon(Icons.lock_outline,
                              color: Color(0xff00966B), size: 20.0),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        text: "NGN"
                      ),
                      TextSpan(
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        text: "${userData.balance}",
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Available balance',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFAF3ED),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.only(
                      left: 5.0,
                      bottom: 6.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            color: Color(0xff00966B),
                            child: Icon(Icons.check_circle_outline_outlined,
                                color: Colors.white, size: 20.0),
                          ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFAF3ED),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.only(left: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            color: Color(0xffFF0B0B),
                            child: Icon(Icons.cancel_outlined,
                                color: Colors.white, size: 20.0),
                          ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
