import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../auth/api_list.dart';
import '../auth/shared_preference.dart';
import '../model/catebory_model.dart';

class CategoryController with ChangeNotifier {
  List<CategoryModel> categoriesData = [];

  Future<void> getAllCategory() async {
    final token = await SharedPriference().getApiToken();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(
        Uri.parse(Api.getCategories),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        List<dynamic> tempList = responseData['data']['categories'];

        categoriesData =
            tempList.map((e) => CategoryModel.fromJson(e)).toList();
      } else {
        log('error');
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
