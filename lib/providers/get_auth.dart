import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:karmilon/models/http_exception.dart';
import 'package:permission_handler/permission_handler.dart';

class GetAuth with ChangeNotifier {
  final String authToken;

  late int _id;
  late String _firstName;
  late String _lastName;
  late bool _isVerified;
  late String _email;
  late int _balance;
  late String _phoneNumber;

  GetAuth(this.authToken);

  int get id {
    return _id;
  }
  String get firstName {
    return _firstName;
  }
  String get lastName {
    return _lastName;
  }
  bool get isVerified {
    return _isVerified;
  }
  
  String get email {
    return _email;
  }

  String get phoneNumber {
    return _phoneNumber;
  }

  int get balance {
    return _balance;
  }
  

  Future<void> getUser() async {
    var url = Uri.parse('https://aqueous-reaches-51901.herokuapp.com/api/v1/users/authenticate');
    try {
      // await Permission.phone.request();
      // if (!await Permission.phone.isGranted) {
      //   throw HttpException("permission missing");
      // }
      
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": authToken,
        },
      );

      final responseData = json.decode(response.body);

      print(json.decode(response.body));

      // if(responseData["payload"]["user"]["is_email_verified"] == true) {
      //   throw HttpException("Your account is not verified");
      // }

      _id = responseData["payload"]["user"]["id"];
      _firstName = responseData["payload"]["user"]["first_name"];
      _lastName = responseData["payload"]["user"]["last_name"];
      _email = responseData["payload"]["user"]["email"];
      _phoneNumber = responseData["payload"]["user"]["phone_number"];
      _balance = responseData["payload"]["user"]["wallet"]["balance"];

      notifyListeners();
    } catch (error) {
      // throw (error);
      rethrow;
    }
  }



  // Future<void> getTransList() async {
  //   print('$authToken');
  //   const url = 'https://aqueous-reaches-51901.herokuapp.com/api/v1/ussd/payments';
  //   try {
  //     final response = await http.get(
  //       url,
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Accept": "application/json",
  //         "Authorization": "$authToken",
  //       },
  //     );

  //     final responseData = json.decode(response.body);

  //     print('get Trans');
  //     print(json.decode(response.body));
  //     print(responseData);

  //     // if(responseData["payload"]["user"]["is_email_verified"] == true) {
  //     //   throw HttpException("Your account is not verified");
  //     // }

  //     // _id = responseData["payload"]["user"]["id"];
  //     // _firstName = responseData["payload"]["user"]["first_name"];
  //     // _lastName = responseData["payload"]["user"]["last_name"];
  //     // _email = responseData["payload"]["user"]["email"];
  //     // _phoneNumber = responseData["payload"]["user"]["phone_number"];
  //     // _balance = responseData["payload"]["user"]["wallet"]["balance"];

  //     notifyListeners();
  //   } catch (error) {
  //     throw (error);
  //   }
  // }



}
