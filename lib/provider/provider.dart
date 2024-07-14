import 'package:flutter/material.dart';
import 'package:mbank_app/models/items.dart';
import 'package:mbank_app/provider/api/api.dart';

class MyDataProvider extends ChangeNotifier {
  final MyApi _api = MyApi();
  final List<Items> _data = [];

  List<Items> get data => _data;

  Future<void> getItems(int offset) async {
   List<Items>list = await _api.getItems(offset);
    _data.addAll(list);
    notifyListeners();
  }
}