import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:karmilon/models/http_exception.dart';

class ResetAuth with ChangeNotifier {

  Future<void> pwdreset(String email) async {
    print(email);
    print('kicked off');
    var url = Uri.parse('https://aqueous-reaches-51901.herokuapp.com/api/v1/reset-password/?');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'email': email
        }),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );

      final responseData = json.decode(response.body);
      //print(responseData["status"].runtimeType);
      
      print(json.decode(response.body));
      if (responseData["success"] == false) {
        throw HttpException(responseData["message"]);
      }

    } catch (error) {
        // print(error);
        // throw error;
        rethrow;
    }
  }


}
