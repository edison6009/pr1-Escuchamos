import 'package:flutter/material.dart';
import 'package:pr1/Api/Command/CountryCommand.dart';
import 'package:pr1/Api/Model/CountryModel.dart';
import 'package:pr1/Api/Service/CountryService.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CountryModel? _CountryData; // Changed "welcomeData" to "countryData"

  @override
  void initState() {
    super.initState();
    _fetchData(); // Iniciar la recuperación de datos al iniciar la aplicación
  }

  void _fetchData() async {
    try {
      // Assuming FetchDataCommand returns a CountryModel
      final countryData = await CountryCommand(CountryIndex()).execute();
      setState(() {
        _CountryData = countryData;
      });
    } catch (error) {
      // Mostrar mensaje de error (opcional)
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Home'),
      ),
      body: Center(
        child: _CountryData != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Países:'), // Changed "Welcome" to "Países"
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _CountryData?.countries?.length ?? 0,
                    itemBuilder: (context, index) {
                      final country = _CountryData?.countries?[index];
                      if (country != null) {
                        return Text(
                          ' - ${country.name} ${country.dialingCode}',
                          style: TextStyle(fontSize: 12),
                        );
                      }
                      return SizedBox
                          .shrink(); // Evitar espacios vacíos si no hay datos
                    },
                  ),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
