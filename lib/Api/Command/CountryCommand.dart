import 'package:pr1/Api/Model/CountryModel.dart';
import 'package:pr1/Api/Service/CountryService.dart';
import 'dart:convert';

class CountryCommand {
  CountryIndex _CountryData;

  CountryCommand(this._CountryData);

  Future<CountryModel> execute() async {
    // Change return type to Future<CountryModel>
    try {
      var response = await _CountryData.fetchData();
      var data = jsonDecode(response);
      return CountryModel.fromJson(data);
    } catch (error) {
      rethrow; // Re-lanzar la excepción para manejarla en la vista
    }
  }
}



