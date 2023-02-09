import 'package:flutter/material.dart';
import 'package:karmilon/widgets/slider.dart';
import 'package:karmilon/widgets/transaction_list.dart';
import 'package:provider/provider.dart';
//import 'package:karmilon/models/user.dart';
import 'package:karmilon/providers/get_auth.dart';
import 'package:karmilon/widgets/drawer.dart';

/*void navigateToSignin(BuildContext context) {
  Navigator.of(context).pushNamed('/');
}*/

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<GetAuth>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Color(0xff00966B),
        ),
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Color(0xff00966B),
          ),
        ),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.payment),
          //   onPressed: () => {
          //     Navigator.of(context).pushNamed('/pay')
          //   },
          // ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => {
              Navigator.of(context).pushNamed('/settings_screen')
            },
          )
        ],
        elevation: 0,
      ),
      drawer: const AppDrawer(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              //color: Colors.grey[400],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset('assets/avatar2.png'),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Hi there ',
                                          style: TextStyle(
                                            color: Color(0xff00966B),
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        Text(
                                          userData.firstName,
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                            color: Color(0xff00966B),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.only(left: 20.0, top: 5.0),
                                    child: const Text(
                                      'How are you feeling today?',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 200,
                            margin: const EdgeInsets.only(right: 5.0),
                            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/bg-img.png"),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4.0),
                                      child: Container(
                                        height: 30.0,
                                        width: 30.0,
                                        color: const Color(0xffFAF3ED),
                                        child: const Icon(Icons.rss_feed,
                                            color: Color(0xff00966B),
                                            size: 20.0),
                                      ),
                                    ),
                                    // Text(
                                    //   'MTN',
                                    //   style: TextStyle(
                                    //       color: Colors.white,
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                  ],
                                ),
                                // Container(
                                //   width: 200,
                                //   child: Column(
                                //     crossAxisAlignment: CrossAxisAlignment.end,
                                //     children: [
                                //       Container(
                                //         padding: EdgeInsets.only(top: 50.0),
                                //         child: Text(
                                //           'N 1500.34',
                                //           style: TextStyle(
                                //               fontSize: 30.0,
                                //               color: Colors.white,
                                //               fontWeight: FontWeight.bold),
                                //         ),
                                //       ),
                                //       Container(
                                //         child: Text(
                                //           'Airtime balance',
                                //           style: TextStyle(
                                //             color: Colors.white,
                                //           ),
                                //         ),
                                //       ),
                                //       Container(
                                //         child: IconButton(
                                //           icon: Icon(
                                //             Icons.loop_outlined,
                                //             size: 20,
                                //             color: Colors.white,
                                //           ),
                                //           onPressed: () => {},
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              InkWell(
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.all(10.0),
                                  margin: const EdgeInsets.only(left: 5.0),
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFAF3ED),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(4.0),
                                        child: Container(
                                          height: 30.0,
                                          width: 30.0,
                                          color: const Color(0xff19ACCC),
                                          child: const Icon(
                                              Icons.shopping_basket_outlined,
                                              color: Colors.white,
                                              size: 20.0),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(left: 10.0),
                                            margin: const EdgeInsets.only(bottom: 3.0),
                                            child: const Text(
                                              'Buy airtime',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(left: 10.0),
                                            child: const Text(
                                              'Buy airtime at cheap rate',
                                              style: TextStyle(
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).pushNamed('/convert_screen');
                                },
                              ),
                              InkWell(
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.all(10.0),
                                  margin: const EdgeInsets.fromLTRB(5.0, 10.0, 0, 10.0),
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFAF3ED),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(4.0),
                                        child: Container(
                                          height: 30.0,
                                          width: 30.0,
                                          color: const Color(0xff4E35E8),
                                          child: const Icon(
                                              Icons.add_shopping_cart ,
                                              color: Colors.white,
                                              size: 20.0),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(left: 10.0),
                                            margin: const EdgeInsets.only(bottom: 3.0),
                                            child: const Text(
                                              'Buy data plans',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(left: 10.0),
                                            child: const Text(
                                              'Buy cheap data plans',
                                              style: TextStyle(
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).pushNamed('/transfer_screen');
                                },
                              ),
                              InkWell(
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.all(10.0),
                                  margin: const EdgeInsets.only(left: 5.0),
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFAF3ED),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(4.0),
                                        child: Container(
                                          height: 30.0,
                                          width: 30.0,
                                          color: const Color(0xffD2317F),
                                          child: const Icon(
                                              Icons.lightbulb_outline,
                                              color: Colors.white,
                                              size: 20.0),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(left: 10.0),
                                            margin: const EdgeInsets.only(bottom: 3.0),
                                            child: const Text(
                                              'Activate smart topups',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(left: 10.0),
                                            child: const Text(
                                              'Setup smart topup for family & friends',
                                              style: TextStyle(
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).pushNamed('/purchase_screen');
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/bg-img2.png"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 20.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4.0),
                                  child: Container(
                                    height: 50.0,
                                    width: 50.0,
                                    color: const Color(0xffFAF3ED),
                                    child: const Icon(
                                        Icons.account_balance_wallet_outlined,
                                        color: Color(0xff00966B),
                                        size: 30.0),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
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
                                      const Text(
                                        'Available balance',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xffFAF3ED),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            height: 90,
                            child: IconButton(
                              icon: const Icon(
                                Icons.add,
                                size: 40,
                                color: Color(0xff00966B),
                              ),
                              onPressed: () => {
                                Navigator.of(context).pushNamed('/wallet_screen')
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: PrefetchImageDemo(),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    padding: const EdgeInsets.all(20.0),
                    decoration: const BoxDecoration(
                      color: Color(0xffFAF3ED),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Row(
                            children: [
                              const Expanded(
                                flex: 11,
                                child: Text(
                                  'Recent transaction',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    size: 20,
                                    color: Color(0xff00966B),
                                  ),
                                  onPressed: () => {
                                    Navigator.of(context).pushNamed('/transaction_screen')
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        TransactionList(),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/bg-img3.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Get 2% discount',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Tell your friends and share on social media to get 2% discount on your next airtime purchase.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: Icon(Icons.money_off,
                                color: Color(0xffFFCB75), size: 80.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
