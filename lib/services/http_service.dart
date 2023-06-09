import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../custem_class/constant/app_functions.dart';

class HttpService {
  static Future<http.Response?> getApi({
    required String url,
    Map<String, String>? header,
  }) async {
    try {
      if (kDebugMode) {
        print("Url => $url");
        print("Header => $header");
      }
      return http.get(
        Uri.parse(url),
        headers: header,
      );
    } catch (e) {
      flutterToast(e.toString());
      return null;
    }
  }

  static Future<http.Response?> postApi({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    try {
      if (kDebugMode) {
        print("Url => $url");
        print("Header => $header");
        print("Body => $body");
      }
      return http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(body),
      );
    } catch (e) {
      flutterToast(e.toString());
      return null;
    }
  }
}
