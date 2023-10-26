import 'package:flutter/material.dart';

class CajaHerramientasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenido',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Image.asset(
              'assets/caja_herramientas.jpg',
              width: 200.0,
              height: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
