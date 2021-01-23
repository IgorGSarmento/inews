import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "http://192.168.0.12:3333";

class API {
  static Future getNews() {
    var url = baseUrl + "/news";
    return http.get(url);
  }

  static Future getEvents() {
    var url = baseUrl + "/events";
    return http.get(url);
  }
}
