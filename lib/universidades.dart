import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UniversidadesPage extends StatefulWidget {
  @override
  _UniversidadesPageState createState() => _UniversidadesPageState();
}

class _UniversidadesPageState extends State<UniversidadesPage> {
  String pais = '';
  List<Universidad> universidades = [];

  Future<void> obtenerUniversidades() async {
    final response = await http.get(Uri.parse('https://www.topuniversities.com/universities=$pais'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Universidad> listaUniversidades = [];

      for (var university in data) {
        listaUniversidades.add(Universidad(
          nombre: university['name'],
          dominio: university['web_pages'][0],
        ));
      }

      setState(() {
        universidades = listaUniversidades;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Universidades por País'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ingresa el nombre del país en inglés:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  pais = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                obtenerUniversidades();
              },
              child: Text('Buscar Universidades'),
            ),
            SizedBox(height: 20.0),
            if (universidades.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: universidades.length,
                  itemBuilder: (context, index) {
                    final universidad = universidades[index];
                    return ListTile(
                      title: Text(universidad.nombre),
                      subtitle: Text('Dominio: ${universidad.dominio}'),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Universidad {
  final String nombre;
  final String dominio;

  Universidad({required this.nombre, required this.dominio});
}
