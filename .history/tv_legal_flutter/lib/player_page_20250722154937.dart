// player de vídeo
import 'package:flutter/material.dart';

class PlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reprodutor de TV')),
      body: Center(
        child: Text('Aqui será exibido o conteúdo de TV legal.'),
      ),
    );
  }
}
