import 'dart:convert';
class ApiUrl{
  // ---------------------------URL base de la API ---------------------------//

  //url para pruebas locales:
  static const String baseUrl = 'http://127.0.0.1:8000/';

  //url para pruebas en el servidor:
  // static const String baseUrl = 'https://escuchamos.onrender.com';

  // -------------------------------------------------------------------------//
}

class ApiResponse {
  final Map<String, dynamic> body; // Contenido de la respuesta
  final int statusCode; // Código de estado HTTP

  ApiResponse(this.body, this.statusCode);

  factory ApiResponse.fromJsonString(String jsonString, int statusCode) {
    // Deserializa la cadena JSON directamente en el constructor
    return ApiResponse(jsonDecode(jsonString), statusCode);
  }
}
