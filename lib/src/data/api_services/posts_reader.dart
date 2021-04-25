import 'dart:convert';

import 'package:http/http.dart';
import 'package:infinit_scroll/src/data/api_services/interfaces_class.dart';

class PostsReader implements Reader<List<dynamic>> {
  static const FETCH_LIMIT = 10;
  final _baseUrl = 'https://jsonplaceholder.typicode.com';

  @override
  Future<List<dynamic>> fetchData(int page) async {
    try {
      final response = await get(
          Uri.parse(_baseUrl + '/posts?_limit=$FETCH_LIMIT&_page=$page'));
      final loadedData = jsonDecode(response.body) as List<dynamic>;
      return loadedData;
    } catch (e) {
      print("Error .." + e.toString());
      throw e.toString();
    }
  }
}
