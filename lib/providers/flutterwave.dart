import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';

class Flutterwave with ChangeNotifier {
  final String authToken;
  // late int _depositAmount;
  // late String _depositRef;

  Flutterwave(this.authToken);


  /*bool get isAuth {
    return token != null;
  }*/

  // int get depositAmount {
  //   return _depositAmount;
  // }

  // String get depositRef {
  //   return _depositRef;
  // }

  Future<void> waveDeposit(String amount, String ref) async {
    print("this ran");
    print(amount);
    print(ref);
    // try { 
    //   Flutterwave flutterwave = Flutterwave.forUIPayment(
    //     context: this.context,
    //     encryptionKey: "Your_test_encryption_key_here",
    //     publicKey: "Your_test_public_key_here",
    //     currency: currency,
    //     amount: amount,
    //     email: "valid@email.com",
    //     fullName: "Valid Full Name",
    //     txRef: ref,
    //     isDebugMode: true,
    //     phoneNumber: "0123456789",
    //     acceptCardPayment: true,
    //     acceptUSSDPayment: false,
    //     acceptAccountPayment: false,
    //     acceptFrancophoneMobileMoney: false,
    //     acceptGhanaPayment: false,
    //     acceptMpesaPayment: false,
    //     acceptRwandaMoneyPayment: true,
    //     acceptUgandaPayment: false,
    //     acceptZambiaPayment: false)
                
    // final ChargeResponse response = await flutterwave.initializeForUiPayments();
              
    // } catch(error) {
    //   handleError(error);
    // }
  }
}
