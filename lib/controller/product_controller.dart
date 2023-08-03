import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../auth/api_list.dart';
import '../auth/shared_preference.dart';
import '../model/product_model.dart';

class ProductController with ChangeNotifier {
  List<ProductModel> productData = [];

  Future<void> getProducts() async {
    final token = await SharedPriference().getApiToken();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(
        Uri.parse(Api.getProduct),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        List<dynamic> tempList = responseData['data']['products'];

        productData = tempList.map((e) => ProductModel.fromJson(e)).toList();
        log(tempList[0].toString());
        //
        // log(response.statusCode.toString());

        notifyListeners();
      } else {
        log('error');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
