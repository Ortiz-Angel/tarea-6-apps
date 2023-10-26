import 'package:flutter/material.dart';

class WordpressPage extends StatefulWidget {
  @override
  _WordpressPageState createState() => _WordpressPageState();
}

class _WordpressPageState extends State<WordpressPage> {
  List<Noticia> noticias = [];

  @override
  void initState() {
    super.initState();
    cargarNoticias();
  }

  void cargarNoticias() {

    setState(() {
      noticias = [
        Noticia(
          titulo: 'El tiroteo más mortífero del año en EE UU causa 18 muertos en Maine',
          resumen: 'El asesino, aún a la fuga, actuó en una bolera y un restaurante de Lewiston, segunda ciudad del Estado del noreste del país',
          url: 'https://elpais.com/internacional/2023-10-26/al-menos-16-muertos-en-un-tiroteo-masivo-en-maine.html',
        ),
        Noticia(
          titulo: 'El apoyo electoral de Bullrich al ultra Milei dinamita al principal frente opositor argentino',
          resumen: 'Los sectores moderados de Juntos por el Cambio, la coalición que en 2015 llevó al poder a Mauricio Macri, advierten que no acompañarán la decisión de la excandidata a la presidencia.',
          url: 'https://elpais.com/argentina/2023-10-26/el-apoyo-electoral-de-bullrich-al-ultra-milei-dinamita-al-principal-frente-opositor-argentino.html',
        ),
        Noticia(
          titulo: 'El lujoso emporio inmobiliario de los saqueadores de Petróleos de Venezuela: 21 viviendas valoradas en 52 millones de dólares',
          resumen: 'La red que expolió la energética recurrió a un opaco entramado societario para adquirir 19 exclusivas propiedades en el país sudamericano',
          url: 'https://elpais.com/internacional/2023-10-26/el-lujoso-emporio-inmobiliario-de-los-saqueadores-de-petroleos-de-venezuela-21-viviendas-valoradas-en-52-millones-de-dolares.html',
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias de elpais'),
      ),
      body: ListView.builder(
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
    );
  }
}

class Noticia {
  final String titulo;
  final String resumen;
  final String url;

  Noticia({required this.titulo, required this.resumen, required this.url});
}
