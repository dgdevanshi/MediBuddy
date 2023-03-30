import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:medibuddy/constants.dart';

class Authservice {
  Future<void> registerClient(
      {required String name,
      required String email,
      required String password,
      required String city}) async {
    final body = {
      'name': name,
      'email': email,
      'password': password,
      'city': city
    };
    final response = await http.post(
      Uri.parse('$ip/client/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      var message = json.decode(response.body)['msg'];
      Fluttertoast.showToast(
          msg: message, backgroundColor: color1, textColor: Colors.white);
    } else if (response.statusCode == 400) {
      var message = json.decode(response.body)['msg'];
      Fluttertoast.showToast(
          msg: message, backgroundColor: color1, textColor: Colors.white);
    } else {
      // Registration failed
      throw Exception('Failed to register user');
    }
  }

  Future<void> registerSeller(
      {required String name,
      required String email,
      required String password,
      required String city,
      required String address,
      required String contact}) async {
    final body = {
      'storeName': name,
      'email': email,
      'password': password,
      'city': city,
      'address': address,
      'phoneNumber': contact
    };

    final response = await http.post(
      Uri.parse('$ip/seller/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      var message = json.decode(response.body)['msg'];
      Fluttertoast.showToast(
          msg: message, backgroundColor: color1, textColor: Colors.white);
    } else if (response.statusCode == 400) {
      var message = json.decode(response.body)['msg'];
      Fluttertoast.showToast(
          msg: message, backgroundColor: color1, textColor: Colors.white);
    } else {
      // Registration failed
      throw Exception('Failed to register user');
    }
  }
}