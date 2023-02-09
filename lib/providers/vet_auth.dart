import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:karmilon/models/http_exception.dart';

class VetAuth with ChangeNotifier {
  final String authToken;
  final int authUserId;
  final String authUserEmail;

  VetAuth(this.authToken, this.authUserId, this.authUserEmail);

  Future<void> verify(
    String code,
  ) async {
    // Map<String, String> headers = {
    //   "Content-Type": "application/json",
    //   "Appect": "application/json",
    //   //"Authorization": "Bearer $authToken",
    //   "Authorization": "$authToken",
    // };
    //final url = 'https://api.karmilon.com/api/v1/users/security/$authUserId?';
    var url = Uri.parse('https://aqueous-reaches-51901.herokuapp.com/api/v1/confirm-email?');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'email': authUserEmail,
          'otp_code': code,
        }),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );
      // final response = await http.post(
      //   url,
      //   body: json.encode(
      //     {
      //       'vet_code': code,
      //     },
      //   ),
      //   headers: headers,
      // );
      final responseData = json.decode(response.body);
      // print(json.decode(response.body));
      if (responseData["status"] == false) {
        throw HttpException(responseData["message"]);
      }
      // print(json.decode(response.body));
    } catch (error) {
      // throw error;
      rethrow;
    }
  }

  Future<void> resendCode() async {
    var url = Uri.parse('https://aqueous-reaches-51901.herokuapp.com/api/v1/short-codes/resend_otp_code?');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'email': authUserEmail,
        }),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );
      final responseData = json.decode(response.body);
      if (responseData["status"] != true) {
        throw HttpException(responseData["message"]);
      }
      print(json.decode(response.body));
    } catch (error) {
      // throw error;
      rethrow;
    }
  }
}
