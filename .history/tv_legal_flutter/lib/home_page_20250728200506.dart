import 'package:flutter/material.dart';
import 'player_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> canais = [
    {
      'title': 'Al Jazeera',
      'url': 'https://live-hls-web-aje.getaj.net/AJE/index.m3u8',
      'icon': 'assets/images/aljazeera.png',
      'category': 'News'
    },
    {
      'title': 'Euronews',
      'url': 'https://rakuten-euronews-1-en.samsung.wurl.tv/playlist.m3u8',
      'icon': 'assets/images/euronews.png',
      'category': 'News'
    },
    {
      'title': 'TV Câmara',
      'url': 'https://stream.camara.leg.br/tv1/manifest.m3u8',
      'icon': 'assets/images/camara.png',
      'category': 'Public'
    },
    {
      'title': 'TV Senado',
      'url': 'https://stream.senado.gov.br/live/stream.m3u8',
      'icon': 'assets/images/senado.png',
      'category': 'Public'
    },
    {
      'title': 'Red Bull TV',
      'url': 'https://rbmn-live.akamaized.net/hls/live/590964/BoRB-AT/master.m3u8',
      'icon': 'assets/images/redbull.png',
      'category': 'Sports'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final categorias = canais.map((c) => c['category']).toSet().toList();

    return Scaffold(
      appBar: AppBar(title: Text('TV Legal')),
      body: ListView(
        children: categorias.map((categoria) {
          final filtrados = canais.where((c) => c['category'] == categoria).toList();
          return ExpansionTile(
            title: Text(categoria, style: TextStyle(fontWeight: FontWeight.bold)),
            children: filtrados.map((canal) {
              return ListTile(
                leading: Image.asset(
                  canal['icon'],
                  width: 40,
                  height: 40,
                  errorBuilder: (_, __, ___) => Icon(Icons.tv),
                ),
                title: Text(canal['title']),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerPage(
                      canalNome: canal['title'],
                      canalUrl: canal['url'],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
