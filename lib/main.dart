import 'package:flutter/material.dart';
import 'package:pr1/App/View/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home:   Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi app'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
              // Navegar a VistaDetalle
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          child: Text('Mi botón'), // Text displayed on the button
        ),
      ),
    );
  }
}
