import 'package:flutter/material.dart';

class GeneroPage extends StatefulWidget {
  @override
  _GeneroPageState createState() => _GeneroPageState();
}

class _GeneroPageState extends State<GeneroPage> {
  String nombre = '';
  String genero = '';
  AssetImage imagenGenero = AssetImage('assets/question.png');

  void determinarGenero() {
    // Lógica para determinar el género aquí (por ejemplo, basado en el nombre).
    if (nombre.toLowerCase().contains('maria')) {
      genero = 'Femenino';
      imagenGenero = AssetImage('assets/rosa.png');
    } else {
      genero = 'Masculino';
      imagenGenero = AssetImage('assets/azul.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Determinar Género'),
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
                determinarGenero();
              },
              child: Text('Determinar Género'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Género: $genero',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Image(
              image: imagenGenero,
              width: 200.0,
              height: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
