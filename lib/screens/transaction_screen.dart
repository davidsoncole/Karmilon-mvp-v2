import 'package:flutter/material.dart';
import 'package:karmilon/widgets/wallet_preview.dart';

/*void navigateToSignin(BuildContext context) {
  Navigator.of(context).pushNamed('/');
}*/

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  _showModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
          height: 400,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Sort history',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          buildCheckbox(),
                          Text(
                            'Completed',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                      ),
                      child: Row(
                        children: [
                          buildCheckbox(),
                          Text(
                            'Declined',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              //color: Color(0xffFF6150),
                              child: Icon(Icons.account_balance_wallet_outlined,
                                  color: Color(0xff151725), size: 25.0),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              'Wallet',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    buildCheckbox(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              //color: Color(0xffFF6150),
                              child: Icon(Icons.monetization_on_outlined,
                                  color: Color(0xff151725), size: 25.0),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              'Get cash',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    buildCheckbox(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              //color: Color(0xffFF6150),
                              child: Icon(Icons.shopping_basket_outlined,
                                  color: Color(0xff151725), size: 25.0),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              'Airtime purchase',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    buildCheckbox(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              //color: Color(0xffFF6150),
                              child: Icon(Icons.card_giftcard_outlined,
                                  color: Color(0xff151725), size: 25.0),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              'Airtime transfer',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    buildCheckbox(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              //color: Color(0xffFF6150),
                              child: Icon(Icons.lightbulb_outline,
                                  color: Color(0xff151725), size: 25.0),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              'Smart topup',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    buildCheckbox(),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  bool value = true;

  Widget buildCheckbox() => Checkbox(
        value: value,
        onChanged: (value) {
          setState(() {
            value = value!;
          });
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xff00966B),
        ),
        title: Text(
          'Transactions',
          style: TextStyle(
            color: Color(0xff00966B),
          ),
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Image.asset('assets/avatar2.png'),
                  ),
                ),
              ),
            ],
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
        child: Column(
          children: [
            WalletPreview(),
            Container(
              margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      //color: Colors.grey[400],
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Transaction history',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'All transactions',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                                FlatButton.icon(
                                  onPressed: () {
                                    //_showModalBottomSheet(context);
                                  },
                                  label: Text(
                                    'SORT',
                                    style: TextStyle(
                                      color: Color(0xff00966B),
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.sort_outlined,
                                    color: Color(0xff00966B),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 30,
                            ),
                            child: Column(
                              children: [
                                // InkWell(
                                //   onTap: () {
                                //     Navigator.of(context)
                                //         .pushNamed('/details_screen');
                                //   },
                                //   child: Container(
                                //     margin: EdgeInsets.only(
                                //       top: 10.0,
                                //       bottom: 10.0,
                                //     ),
                                //     child: Row(
                                //       children: [
                                //         Expanded(
                                //           flex: 1,
                                //           child: Container(
                                //             child: Column(
                                //               crossAxisAlignment:
                                //                   CrossAxisAlignment.start,
                                //               children: [
                                //                 ClipRRect(
                                //                   borderRadius:
                                //                       BorderRadius.circular(
                                //                           4.0),
                                //                   child: Container(
                                //                     height: 40.0,
                                //                     width: 40.0,
                                //                     color: Color(0xffFF6150),
                                //                     child: Icon(
                                //                         Icons
                                //                             .account_balance_wallet_outlined,
                                //                         color: Colors.white,
                                //                         size: 25.0),
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ),
                                //         Expanded(
                                //           flex: 4,
                                //           child: Container(
                                //             child: Container(
                                //               child: Column(
                                //                 crossAxisAlignment:
                                //                     CrossAxisAlignment.start,
                                //                 children: [
                                //                   Container(
                                //                     child: Text(
                                //                       'Deposit',
                                //                       style: TextStyle(
                                //                         fontSize: 16,
                                //                         fontWeight:
                                //                             FontWeight.bold,
                                //                       ),
                                //                     ),
                                //                   ),
                                //                   SizedBox(
                                //                     height: 5,
                                //                   ),
                                //                   Container(
                                //                     child: Row(
                                //                       children: [
                                //                         Container(
                                //                           child: Text(
                                //                             '26 May,',
                                //                             style: TextStyle(
                                //                               color:
                                //                                   Colors.grey,
                                //                               fontSize: 12,
                                //                             ),
                                //                           ),
                                //                         ),
                                //                         Container(
                                //                           child: Text(
                                //                             ' 3:45',
                                //                             style: TextStyle(
                                //                               color:
                                //                                   Colors.grey,
                                //                               fontSize: 12,
                                //                             ),
                                //                           ),
                                //                         ),
                                //                       ],
                                //                     ),
                                //                   ),
                                //                 ],
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //         Expanded(
                                //           flex: 2,
                                //           child: Container(
                                //             child: Text(
                                //               'N 5000',
                                //               textAlign: TextAlign.end,
                                //               style: TextStyle(
                                //                 fontSize: 16,
                                //                 fontWeight: FontWeight.bold,
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                // Divider(),
                                // Container(
                                //   margin: EdgeInsets.only(
                                //     top: 10.0,
                                //     bottom: 10.0,
                                //   ),
                                //   child: Row(
                                //     children: [
                                //       Expanded(
                                //         flex: 1,
                                //         child: Container(
                                //           child: Column(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.start,
                                //             children: [
                                //               ClipRRect(
                                //                 borderRadius:
                                //                     BorderRadius.circular(4.0),
                                //                 child: Container(
                                //                   height: 40.0,
                                //                   width: 40.0,
                                //                   color: Color(0xff19ACCC),
                                //                   child: Icon(
                                //                       Icons
                                //                           .monetization_on_outlined,
                                //                       color: Colors.white,
                                //                       size: 25.0),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ),
                                //       Expanded(
                                //         flex: 4,
                                //         child: Container(
                                //           child: Container(
                                //             child: Column(
                                //               crossAxisAlignment:
                                //                   CrossAxisAlignment.start,
                                //               children: [
                                //                 Container(
                                //                   child: Text(
                                //                     'Get cash',
                                //                     style: TextStyle(
                                //                       fontSize: 16,
                                //                       fontWeight:
                                //                           FontWeight.bold,
                                //                     ),
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   height: 5,
                                //                 ),
                                //                 Container(
                                //                   child: Row(
                                //                     children: [
                                //                       Container(
                                //                         child: Text(
                                //                           '26 May,',
                                //                           style: TextStyle(
                                //                             color: Colors.grey,
                                //                             fontSize: 12,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           ' 3:45',
                                //                           style: TextStyle(
                                //                             color: Colors.grey,
                                //                             fontSize: 12,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //       Expanded(
                                //         flex: 2,
                                //         child: Container(
                                //           child: Text(
                                //             'N 5000',
                                //             textAlign: TextAlign.end,
                                //             style: TextStyle(
                                //               fontSize: 16,
                                //               fontWeight: FontWeight.bold,
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // Divider(),
                                // Container(
                                //   margin: EdgeInsets.only(
                                //     top: 10.0,
                                //     bottom: 10.0,
                                //   ),
                                //   child: Row(
                                //     children: [
                                //       Expanded(
                                //         flex: 1,
                                //         child: Container(
                                //           child: Column(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.start,
                                //             children: [
                                //               ClipRRect(
                                //                 borderRadius:
                                //                     BorderRadius.circular(4.0),
                                //                 child: Container(
                                //                   height: 40.0,
                                //                   width: 40.0,
                                //                   color: Color(0xff4E35E8),
                                //                   child: Icon(
                                //                       Icons
                                //                           .card_giftcard_outlined,
                                //                       color: Colors.white,
                                //                       size: 25.0),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ),
                                //       Expanded(
                                //         flex: 4,
                                //         child: Container(
                                //           child: Container(
                                //             child: Column(
                                //               crossAxisAlignment:
                                //                   CrossAxisAlignment.start,
                                //               children: [
                                //                 Container(
                                //                   child: Text(
                                //                     'Airtime transfer',
                                //                     style: TextStyle(
                                //                       fontSize: 16,
                                //                       fontWeight:
                                //                           FontWeight.bold,
                                //                     ),
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   height: 5,
                                //                 ),
                                //                 Container(
                                //                   child: Row(
                                //                     children: [
                                //                       Container(
                                //                         child: Text(
                                //                           '26 May,',
                                //                           style: TextStyle(
                                //                             color: Colors.grey,
                                //                             fontSize: 12,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           ' 3:45',
                                //                           style: TextStyle(
                                //                             color: Colors.grey,
                                //                             fontSize: 12,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //       Expanded(
                                //         flex: 2,
                                //         child: Container(
                                //           child: Text(
                                //             'N 5000',
                                //             textAlign: TextAlign.end,
                                //             style: TextStyle(
                                //               fontSize: 16,
                                //               fontWeight: FontWeight.bold,
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // Divider(),
                                // Container(
                                //   margin: EdgeInsets.only(
                                //     top: 10.0,
                                //     bottom: 10.0,
                                //   ),
                                //   child: Row(
                                //     children: [
                                //       Expanded(
                                //         flex: 1,
                                //         child: Container(
                                //           child: Column(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.start,
                                //             children: [
                                //               ClipRRect(
                                //                 borderRadius:
                                //                     BorderRadius.circular(4.0),
                                //                 child: Container(
                                //                   height: 40.0,
                                //                   width: 40.0,
                                //                   color: Color(0xffD2317F),
                                //                   child: Icon(
                                //                       Icons
                                //                           .shopping_basket_outlined,
                                //                       color: Colors.white,
                                //                       size: 25.0),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ),
                                //       Expanded(
                                //         flex: 4,
                                //         child: Container(
                                //           child: Container(
                                //             child: Column(
                                //               crossAxisAlignment:
                                //                   CrossAxisAlignment.start,
                                //               children: [
                                //                 Container(
                                //                   child: Text(
                                //                     'Airtime purchase',
                                //                     style: TextStyle(
                                //                       fontSize: 16,
                                //                       fontWeight:
                                //                           FontWeight.bold,
                                //                     ),
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   height: 5,
                                //                 ),
                                //                 Container(
                                //                   child: Row(
                                //                     children: [
                                //                       Container(
                                //                         child: Text(
                                //                           '26 May,',
                                //                           style: TextStyle(
                                //                             color: Colors.grey,
                                //                             fontSize: 12,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           ' 3:45',
                                //                           style: TextStyle(
                                //                             color: Colors.grey,
                                //                             fontSize: 12,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //       Expanded(
                                //         flex: 2,
                                //         child: Container(
                                //           child: Text(
                                //             'N 5000',
                                //             textAlign: TextAlign.end,
                                //             style: TextStyle(
                                //               fontSize: 16,
                                //               fontWeight: FontWeight.bold,
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // Divider(),
                                // Container(
                                //   margin: EdgeInsets.only(
                                //     top: 10.0,
                                //     bottom: 10.0,
                                //   ),
                                //   child: Row(
                                //     children: [
                                //       Expanded(
                                //         flex: 1,
                                //         child: Container(
                                //           child: Column(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.start,
                                //             children: [
                                //               ClipRRect(
                                //                 borderRadius:
                                //                     BorderRadius.circular(4.0),
                                //                 child: Container(
                                //                   height: 40.0,
                                //                   width: 40.0,
                                //                   color: Color(0xffFFA800),
                                //                   child: Icon(
                                //                       Icons.lightbulb_outline,
                                //                       color: Colors.white,
                                //                       size: 25.0),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ),
                                //       Expanded(
                                //         flex: 4,
                                //         child: Container(
                                //           child: Container(
                                //             child: Column(
                                //               crossAxisAlignment:
                                //                   CrossAxisAlignment.start,
                                //               children: [
                                //                 Container(
                                //                   child: Text(
                                //                     'Smart topup',
                                //                     style: TextStyle(
                                //                       fontSize: 16,
                                //                       fontWeight:
                                //                           FontWeight.bold,
                                //                     ),
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   height: 5,
                                //                 ),
                                //                 Container(
                                //                   child: Row(
                                //                     children: [
                                //                       Container(
                                //                         child: Text(
                                //                           '26 May,',
                                //                           style: TextStyle(
                                //                             color: Colors.grey,
                                //                             fontSize: 12,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           ' 3:45',
                                //                           style: TextStyle(
                                //                             color: Colors.grey,
                                //                             fontSize: 12,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //       Expanded(
                                //         flex: 2,
                                //         child: Container(
                                //           child: Text(
                                //             'N 5000',
                                //             textAlign: TextAlign.end,
                                //             style: TextStyle(
                                //               fontSize: 16,
                                //               fontWeight: FontWeight.bold,
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
