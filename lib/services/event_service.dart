import 'dart:convert';

import 'package:events_app/constants/api_path.dart';
import 'package:http/http.dart' as http;

class EventService{
  static Map<String, String> _headers() => {
    'Content-type': 'application/json'
  };


  Future<Map<String, dynamic>> getEvents() async {

    final response = await http.get(
      uriEvents(),
      headers: _headers()
    );

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      return data;
    }else{
      throw Exception("Failed fetch data");
    }

  }

}