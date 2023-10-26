import 'package:flutter/material.dart';

class EdadPage extends StatefulWidget {
  @override
  _EdadPageState createState() => _EdadPageState();
}

class _EdadPageState extends State<EdadPage> {
  String nombre = '';
  int edad = 0;
  String mensajeEdad = '';

  void determinarEdad() {
    // Lógica para determinar la edad aquí (por ejemplo, basada en el nombre).
    if (nombre.toLowerCase().contains('joven')) {
      edad = 25;
      mensajeEdad = 'Eres joven.';
    } else if (nombre.toLowerCase().contains('adulto')) {
      edad = 40;
      mensajeEdad = 'Eres un adulto.';
    } else {
      edad = 70;
      mensajeEdad = 'Eres una persona mayor.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Determinar Edad'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ingresa un nombre:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  nombre = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                determinarEdad();
              },
              child: Text('Determinar Edad'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Edad: $edad años',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Text(
              mensajeEdad,
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
