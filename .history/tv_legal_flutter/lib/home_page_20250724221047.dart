import 'package:flutter/material.dart';
import 'player_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> channels = [
    {
      'title': 'Al Jazeera',
      'url': 'https://live-hls-web-aje.getaj.net/AJE/index.m3u8',
      'icon': 'assets/images/aljazeera.png',
      'category': 'Notícias'
    },
    {
      'title': 'TV Câmara',
      'url': 'https://stream.camara.leg.br/tv1/manifest.m3u8',
      'icon': 'assets/images/camara.png',
      'category': 'Notícias'
    },
    {
      'title': 'RTP 1',
      'url': 'https://streaming-live.rtp.pt/liverepeater/rtp1.smil/playlist.m3u8',
      'icon': 'assets/images/rtp.png',
      'category': 'Públicos'
    },
    {
      'title': 'Canal 11',
      'url': 'https://stream.ads.ot.tv/11tv.m3u8',
      'icon': 'assets/images/canal11.png',
      'category': 'Desporto'
    },
    {
      'title': 'Euronews PT',
      'url': 'https://rakuten-euronews-1-pt.samsung.wurl.tv/playlist.m3u8',
      'icon': 'assets/images/euronews.png',
      'category': 'Desporto'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final categories = channels.map((c) => c['category']).toSet().toList();

    return Scaffold(
      appBar: AppBar(title: Text('TV Legal')),
      body: ListView(
        children: categories.map((category) {
          final filtered = channels.where((c) => c['category'] == category).toList();
          return ExpansionTile(
            title: Text(category, style: TextStyle(fontWeight: FontWeight.bold)),
            children: filtered.map((channel) {
              return ListTile(
                leading: Image.asset(channel['icon'], width: 40, height: 40, errorBuilder: (_, __, ___) => Icon(Icons.tv)),
                title: Text(channel['title']),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerPage(
                      canalNome: channel['title'],
                        canalUrl: channel['url'],
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
