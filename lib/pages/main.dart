import 'package:flutter/material.dart';
import 'package:tarea_6/pages/caja_herramientas.dart';
import 'package:tarea_6/pages/genero.dart';
import 'package:tarea_6/pages/edad.dart';
import 'package:tarea_6/pages/universidades.dart';
import 'package:tarea_6/pages/clima_rd.dart';
import 'package:tarea_6/pages/wordpress.dart';
import 'package:tarea_6/pages/acerca_de.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tu Aplicación',
      initialRoute: '/',
      routes: {
        '/': (context) => InicioPage(),
        '/caja_herramientas': (context) => CajaHerramientasPage(),
        '/genero': (context) => GeneroPage(),
        '/edad': (context) => EdadPage(),
        '/universidades': (context) => UniversidadesPage(),
        '/clima_rd': (context) => ClimaRDPage(),
        '/wordpress': (context) => WordpressPage(),
        '/acerca_de': (context) => AcercaDePage(),
      },
    );
  }
}

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/caja_herramientas');
              },
              child: Text('Caja de Herramientas'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/genero');
              },
              child: Text('Género'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/edad');
              },
              child: Text('Edad'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/universidades');
              },
              child: Text('Universidades'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/clima_rd');
              },
              child: Text('Clima en RD'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/wordpress');
              },
              child: Text('Wordpress'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/acerca_de');
              },
              child: Text('Acerca de'),
            ),
          ],
        ),
      ),
    );
  }
}
