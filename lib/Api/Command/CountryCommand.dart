import 'package:pr1/Api/Model/CountryModel.dart';
import 'package:pr1/Api/Service/CountryService.dart';
import 'dart:convert';

class CountryCommand {
  CountryIndex _countryData;

  CountryCommand(this._countryData);

  Future<CountryModel?> execute() async {
    try {
      var apiResponse = await _countryData.fetchData();

      // Verifica el código de estado
      if (apiResponse.statusCode == 200) {
        // Si es 200, convierte el mapa JSON a un modelo
        return CountryModel.fromJson(apiResponse.body);
      } else {
        // Si no es 200, lanza una excepción con el mensaje de error del mapa
        throw Exception('Error: ${apiResponse.body['message']}');
      }
    } catch (error) {
      // Captura y lanza de nuevo la excepción para manejarla más arriba si es necesario
      rethrow;
    }
  }
}




