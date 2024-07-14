import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mbank_app/models/items.dart';

class MyApi {
  static const baseUrl = 'https://api.valantis.store:41000/';
  static const headers = {
    "Content-Type": "application/json",
    "X-Auth": "bf5f9b6e3e5afcc24c87e1fed9b76c5c",
  };
  final url = Uri.parse(baseUrl);

  Future<List<String>> getIds(int offset) async {
    final response = await http.post(url,
        headers: headers,
        body: jsonEncode({
          "action": "get_ids",
          "params": {"offset": offset, "limit": 20}
        }));
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<dynamic> result = decoded['result'];
      final List<String> ids = result.map((e) => e.toString()).toList();
      return ids;
      } 
      else if (response.statusCode == 500) {
      return await getIds(offset);
    } 
    else {
      throw Exception('Failed to load data');
    }
  }

Future<List<Items>> getItems(int offset) async {
    final List<String>ids = await getIds(offset);
    final response = await http.post(url,
        headers: headers,
        body: jsonEncode({
          "action": "get_items",
          "params": {"ids": ids}
        }));
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<dynamic> result = decoded['result'];
      final List<Items> items = result
          .map((e) => Items(
              brand: e['brand'],
              price: e['price'],
              product: e['product'],
              id: e['id']))
          .toList();
      return items;
    } else if (response.statusCode == 500) {
      return await getItems(offset);
    } else {
      throw Exception('Failed to load data');
    }
  }
}