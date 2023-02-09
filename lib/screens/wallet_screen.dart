import 'package:flutter/material.dart';
import 'package:karmilon/widgets/forms/deposit_form.dart';
import 'package:karmilon/widgets/forms/withdrawal_form.dart';
import 'package:provider/provider.dart';
import 'package:karmilon/providers/get_auth.dart';


// modal bottom sheet deposit
class ModalBottomSheetDeposit extends StatefulWidget {
  const ModalBottomSheetDeposit({Key? key}) : super(key: key);


  @override
  _ModalBottomSheetDepositState createState() => _ModalBottomSheetDepositState();
}

class _ModalBottomSheetDepositState extends State<ModalBottomSheetDeposit> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
        height: 260,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20.0, 0, 30.0),
                child: const Text(
                  'Deposit',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const DepositForm(),
            ],
          ),
        ),
      ),
    );
  } 
}

// modal bottom sheet withdraw
class ModalBottomSheetWithdraw extends StatefulWidget {
  const ModalBottomSheetWithdraw({Key? key}) : super(key: key);


  @override
  _ModalBottomSheetWithdrawState createState() => _ModalBottomSheetWithdrawState();
}

class _ModalBottomSheetWithdrawState extends State<ModalBottomSheetWithdraw> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
        height: 260,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20.0, 0, 30.0),
                child: const Text(
                  'Withdrawal',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              WithdrawalForm(),
            ],
          ),
        ),
      ),
    );
  } 
}

//wallet screen
class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  
  // _showModalBottomSheet(context) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     builder: (BuildContext context) {
  //       return 
  //     },
  //   );
  // }

  // _showModalBottomSheetTwo(context) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     builder: (BuildContext context) {
  //       return 
  //     },
  //   );
  // }

  // deposit modal
  _showModalBottomSheetDeposit(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const ModalBottomSheetDeposit();
      },
    );
  }

  // withdrawal modal
  _showModalBottomSheetWithdraw(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const ModalBottomSheetWithdraw();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<GetAuth>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xff00966B),
        ),
        title: Text(
          'Wallet',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
              //color: Colors.grey[400],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffFAF3ED),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        margin: EdgeInsets.only(top: 175),
                        height: 665,
                      ),
                      Container(
                        height: 480,
                        margin: EdgeInsets.fromLTRB(30.0, 330.0, 30.0, 30.0),
                        padding: EdgeInsets.all(
                          20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recent Transactions',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    size: 20,
                                    color: Color(0xff00966B),
                                  ),
                                  onPressed: () => {},
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  // SizedBox(
                                  //   height: 20,
                                  // ),
                                  // Container(
                                  //   margin: EdgeInsets.only(bottom: 20.0),
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
                                  //                     BorderRadius.circular(
                                  //                         4.0),
                                  //                 child: Container(
                                  //                   height: 40.0,
                                  //                   width: 40.0,
                                  //                   color: Color(0xffFF6150),
                                  //                   child: Icon(
                                  //                       Icons
                                  //                           .account_balance_wallet_outlined,
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
                                  //                     'Deposit',
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
                                  //                             color:
                                  //                                 Colors.grey,
                                  //                             fontSize: 12,
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                       Container(
                                  //                         child: Text(
                                  //                           ' 3:45',
                                  //                           style: TextStyle(
                                  //                             color:
                                  //                                 Colors.grey,
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
                                  // Container(
                                  //   margin: EdgeInsets.only(bottom: 20.0),
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
                                  //                     BorderRadius.circular(
                                  //                         4.0),
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
                                  //                             color:
                                  //                                 Colors.grey,
                                  //                             fontSize: 12,
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                       Container(
                                  //                         child: Text(
                                  //                           ' 3:45',
                                  //                           style: TextStyle(
                                  //                             color:
                                  //                                 Colors.grey,
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
                                  // Container(
                                  //   margin: EdgeInsets.only(bottom: 20.0),
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
                                  //                     BorderRadius.circular(
                                  //                         4.0),
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
                                  //                             color:
                                  //                                 Colors.grey,
                                  //                             fontSize: 12,
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                       Container(
                                  //                         child: Text(
                                  //                           ' 3:45',
                                  //                           style: TextStyle(
                                  //                             color:
                                  //                                 Colors.grey,
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
                                  // Container(
                                  //   margin: EdgeInsets.only(bottom: 20.0),
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
                                  //                     BorderRadius.circular(
                                  //                         4.0),
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
                                  //                             color:
                                  //                                 Colors.grey,
                                  //                             fontSize: 12,
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                       Container(
                                  //                         child: Text(
                                  //                           ' 3:45',
                                  //                           style: TextStyle(
                                  //                             color:
                                  //                                 Colors.grey,
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
                                  //
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 300,
                        width: 250,
                        padding: EdgeInsets.all(
                          20,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/karmilon_card.png"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4.0),
                                  child: Container(
                                    height: 30.0,
                                    width: 30.0,
                                    color: Color(0xff008962),
                                    child: Icon(Icons.lock_outline,
                                        color: Colors.white, size: 20.0),
                                  ),
                                ),
                                Container()
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Total Balance',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'N ${userData.balance}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${userData.lastName} ${userData.firstName}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Container()
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/Flutterwave-logo.png',
                                ),
                                Icon(
                                  Icons.account_balance_wallet_outlined,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 310,
                        child: SizedBox(
                          height: 300,
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 70,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.remove_sharp,
                                  size: 30,
                                  color: Color(0xff00966B),
                                ),
                                onPressed: () => {
                                  _showModalBottomSheetWithdraw(context),
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'WITHDRAW',
                                style: TextStyle(
                                  color: Color(0xff00966B),
                                  fontSize: 10,
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Color(0xff00966B),
                                ),
                                onPressed: () => {
                                  _showModalBottomSheetDeposit(context),
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'DEPOSIT',
                                style: TextStyle(
                                  color: Color(0xff00966B),
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
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
