
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
      'title': 'Red Bull TV',
      'url': 'https://rbmn-live.akamaized.net/hls/live/590964/BoRB-AT/master.m3u8',
      'icon': 'assets/images/redbull.png',
      'category': 'Sports'
    },
    {
      'title': 'DW News',
      'url': 'https://dwamdstream102.akamaized.net/hls/live/2015525/dwstream102/index.m3u8',
      'icon': 'assets/images/dw.png',
      'category': 'News'
    },
    {
      'title': 'France 24',
      'url': 'https://static.france24.com/live/F24_EN_HI_HLS/live_tv.m3u8',
      'icon': 'assets/images/france24.png',
      'category': 'News'
    },
    {
      'title': 'CGTN',
      'url': 'https://news.cgtn.com/resource/live/english/cgtn-news.m3u8',
      'icon': 'assets/images/cgtn.png',
      'category': 'News'
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
