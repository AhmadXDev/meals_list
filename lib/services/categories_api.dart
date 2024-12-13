import 'dart:convert';

import 'package:http/http.dart' as http;

class CategoriesApi {
  String link = "https://www.themealdb.com/api/json/v1/1/categories.php";

  getData() async {
    var uri = Uri.parse(link);
    var response = await http.get(uri);

    var categoriesJson = json.decode(response.body);

    for (var category in categoriesJson) {}
  }
}
