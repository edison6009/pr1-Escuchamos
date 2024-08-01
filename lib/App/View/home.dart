import 'package:flutter/material.dart';
import 'package:pr1/Api/Command/CountryCommand.dart';
import 'package:pr1/Api/Model/CountryModel.dart';
import 'package:pr1/Api/Service/CountryService.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CountryModel? _CountryData; // Datos del país
  bool _isLoading = true; // Estado de carga
  String? _selectedCountry; // País seleccionado

  @override
  void initState() {
    super.initState();
    _fetchData(); // Iniciar la recuperación de datos al iniciar la aplicación
  }

  void _fetchData() async {
    setState(() {
      _isLoading = true; // Indicar que está cargando
    });

    try {
      final countryData = await CountryCommand(CountryIndex()).execute();
      setState(() {
        _CountryData = countryData;
        _isLoading = false; // Datos cargados
      });
    } catch (error) {
      setState(() {
        _isLoading = false; // Detener el estado de carga
      });
      // Muestra un diálogo de alerta con el mensaje de error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('No se pudo cargar la información: $error'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Home'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator() // Indicador de carga
            : _CountryData != null
                ? DropdownButton<String>(
                    value: _selectedCountry,
                    hint: Text('Seleccione un país'),
                    items: _CountryData!.countries!.map((country) {
                      return DropdownMenuItem<String>(
                        value: country.dialingCode, // Usa el nombre correcto aquí
                        child: Text('${country.name} (${country.dialingCode})'),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCountry = newValue;
                      });
                    },
                  )
                : Text(
                    'No se encontraron datos'), // Mensaje cuando no hay datos
      ),
    );
  }
}
