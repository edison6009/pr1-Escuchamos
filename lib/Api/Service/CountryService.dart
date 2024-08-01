import 'package:http/http.dart' as http;
import 'package:pr1/Constants/Constants.dart';
import 'dart:convert';

class CountryIndex {
  Future<ApiResponse> fetchData() async {
    var response = await http.get(Uri.parse('${ApiUrl.baseUrl}country/'));

    // Crea ApiResponse directamente al decodificar la respuesta
    return ApiResponse.fromJsonString(
      utf8.decode(response.bodyBytes),
      response.statusCode,
    );
  }
}



