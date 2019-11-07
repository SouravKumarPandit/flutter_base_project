//import 'dart:convert';
//import 'package:flutter_base_project/core/models/user.dart';
//import 'package:flutter_base_project/core/services/base_service/repository.dart';
//import 'package:http/http.dart' show Client;
//
//final _root = 'https://hacker-news.firebaseio.com/v0';
//
//class NewsApiProvider implements Source {
//  Client client = Client();
//
//  Future<List<int>> fetchTopIds() async {
//    final response = await client.get('$_root/topstories.json');
//    final ids = json.decode(response.body);
//
//    return ids.cast<int>();
//  }
//
//  Future<User> fetchItem(int id) async {
//    final response = await client.get('$_root/item/$id.json');
//    final parsedJson = json.decode(response.body);
//
//    return User.fromJson(parsedJson);
//  }
//}
