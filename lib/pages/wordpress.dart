import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WordpressPage extends StatefulWidget {
  @override
  _WordpressPageState createState() => _WordpressPageState();
}

class _WordpressPageState extends State<WordpressPage> {
  String wordpressUrl = 'https://elpais.com/america/';
  List<Noticia> noticias = [];

  Future<void> obtenerNoticias() async {
    final response = await http.get(Uri.parse(wordpressUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Noticia> listaNoticias = [];

      for (var post in data) {
        listaNoticias.add(Noticia(
          titulo: post['title']['rendered'],
          resumen: post['excerpt']['rendered'],
          link: post['link'],
        ));
      }

      setState(() {
        noticias = listaNoticias;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias de elpais'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Logo',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                obtenerNoticias();
              },
              child: Text('Obtener Noticias'),
            ),
            SizedBox(height: 20.0),
            if (noticias.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: noticias.length,
                  itemBuilder: (context, index) {
                    final noticia = noticias[index];
                    return ListTile(
                      title: Text(noticia.titulo),
                      subtitle: Text(noticia.resumen),
                      onTap: () {

                      },
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

class Noticia {
  final String titulo;
  final String resumen;
  final String link;

  Noticia({required this.titulo, required this.resumen, required this.link});
}
