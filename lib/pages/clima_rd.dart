import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClimaRDPage extends StatefulWidget {
  @override
  _ClimaRDPageState createState() => _ClimaRDPageState();
}

class _ClimaRDPageState extends State<ClimaRDPage> {
  String apiKey = 'fbe8452b6f655c896b8e002f83d18663';
  String ciudad = 'Santo Domingo,DO';
  double temperatura = 0.0;
  String descripcion = '';
  String iconoClima = '';

  Future<void> obtenerClima() async {
    final response = await http.get(
        Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$ciudad&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        temperatura = data['main']['temp'];
        descripcion = data['weather'][0]['description'];
        iconoClima = data['weather'][0]['icon'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clima en República Dominicana'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pronóstico de Clima en Santo Domingo:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Temperatura: $temperatura°C',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Descripción: $descripcion',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            if (iconoClima.isNotEmpty)
              Image.network(
                'https://openweathermap.org/img/w/$iconoClima.png',
                width: 100.0,
                height: 100.0,
              ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                obtenerClima();
              },
              child: Text('Obtener Pronóstico'),
            ),
          ],
        ),
      ),
    );
  }
}
