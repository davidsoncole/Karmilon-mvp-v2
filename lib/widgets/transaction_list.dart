import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Container(
          //   margin: EdgeInsets.only(bottom: 20.0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 1,
          //         child: Container(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               ClipRRect(
          //                 borderRadius: BorderRadius.circular(4.0),
          //                 child: Container(
          //                   height: 40.0,
          //                   width: 40.0,
          //                   color: Color(0xffFF6150),
          //                   child: Icon(Icons.account_balance_wallet_outlined,
          //                       color: Colors.white, size: 25.0),
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
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Container(
          //                   child: Text(
          //                     'Deposit',
          //                     style: TextStyle(
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold,
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
          // Container(
          //   margin: EdgeInsets.only(bottom: 20.0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 1,
          //         child: Container(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               ClipRRect(
          //                 borderRadius: BorderRadius.circular(4.0),
          //                 child: Container(
          //                   height: 40.0,
          //                   width: 40.0,
          //                   color: Color(0xff19ACCC),
          //                   child: Icon(Icons.monetization_on_outlined,
          //                       color: Colors.white, size: 25.0),
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
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Container(
          //                   child: Text(
          //                     'Get cash',
          //                     style: TextStyle(
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold,
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
          // Container(
          //   margin: EdgeInsets.only(bottom: 20.0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 1,
          //         child: Container(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               ClipRRect(
          //                 borderRadius: BorderRadius.circular(4.0),
          //                 child: Container(
          //                   height: 40.0,
          //                   width: 40.0,
          //                   color: Color(0xff4E35E8),
          //                   child: Icon(Icons.card_giftcard_outlined,
          //                       color: Colors.white, size: 25.0),
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
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Container(
          //                   child: Text(
          //                     'Airtime transfer',
          //                     style: TextStyle(
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold,
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
          // Container(
          //   margin: EdgeInsets.only(bottom: 20.0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 1,
          //         child: Container(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               ClipRRect(
          //                 borderRadius: BorderRadius.circular(4.0),
          //                 child: Container(
          //                   height: 40.0,
          //                   width: 40.0,
          //                   color: Color(0xffD2317F),
          //                   child: Icon(Icons.shopping_basket_outlined,
          //                       color: Colors.white, size: 25.0),
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
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Container(
          //                   child: Text(
          //                     'Airtime purchase',
          //                     style: TextStyle(
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold,
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
          // Container(
          //   margin: EdgeInsets.only(bottom: 20.0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 1,
          //         child: Container(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               ClipRRect(
          //                 borderRadius: BorderRadius.circular(4.0),
          //                 child: Container(
          //                   height: 40.0,
          //                   width: 40.0,
          //                   color: Color(0xffFFA800),
          //                   child: Icon(Icons.lightbulb_outline,
          //                       color: Colors.white, size: 25.0),
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
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Container(
          //                   child: Text(
          //                     'Smart topup',
          //                     style: TextStyle(
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold,
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
    );
  }
}
