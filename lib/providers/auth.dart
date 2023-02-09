import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:karmilon/models/http_exception.dart';

class Auth with ChangeNotifier {
  late String _token;
  late int _userId;
  late String _userEmail;


  /*bool get isAuth {
    return token != null;
  }*/

  String get token {
    return _token;
  }

  int get userId {
    return _userId;
  }

  String get userEmail {
    return _userEmail;
  }

  
  

  Future<void> signin(String email, String password) async {
    var url = Uri.parse('https://aqueous-reaches-51901.herokuapp.com/api/v1/login?');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'email': email,
          'password': password,
        }),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );

      final responseData = json.decode(response.body);
        //print(responseData["status"].runtimeType);
        
        print(json.decode(response.body));
        if (responseData["status"] == false) {
          throw HttpException(responseData["message"]);
        }
        
        _token = responseData["token"];
        _userId = responseData["payload"]["id"];
        _userEmail = responseData["payload"]["email"];
        notifyListeners();
    } catch (error) {
        // print(error);
        // throw error;
        rethrow;
    }
  }

  Future<void> signup(
      String firstname, String lastname, String email, String phone, String password) async {
    var url = Uri.parse('https://aqueous-reaches-51901.herokuapp.com/api/v1/register?');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'first_name': firstname,
            'last_name': lastname,
            'email': email,
            'phone_number': phone,
            'password': password,
          },
        ),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );
      final responseData = json.decode(response.body);
      // var parsedJson = responseData;

        print(json.decode(response.body));
        
        if (responseData["status"] == false) {
          throw HttpException(responseData["message"]);
        }
        _token = responseData["data"]["token"];
        _userId = responseData["data"]["user"]["id"];
        _userEmail = responseData["data"]["user"]["email"];
        notifyListeners();
    } catch (error) {
        // print(error);
        rethrow;
        // throw error;
    }
  }
}
