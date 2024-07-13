import 'package:http/http.dart' as http;
import 'package:pr1/Constants/Constants.dart';
import 'dart:convert';

class CountryIndex {
  Future<String> fetchData() async {
    var response = await http.get(Uri.parse('${Constants.baseUrl}/countries'));

    if (response.statusCode == 200) {
      var decodedData = utf8.decode(response.bodyBytes);
      return decodedData;
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  }
}

