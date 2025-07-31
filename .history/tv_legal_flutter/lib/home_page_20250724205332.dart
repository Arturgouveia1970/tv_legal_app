
import 'package:flutter/material.dart';
import 'player_page.dart';

class HomePage extends StatelessWidget {
  final Map<String, List<Map<String, String>>> canaisPorCategoria = {
    'Notícias': [
      {
        'nome': 'Al Jazeera',
        'url': 'https://live-hls-web-aje.getaj.net/AJE/index.m3u8',
        'icon': 'assets/images/aljazeera.png',
      },
      {
        'nome': 'TV Câmara',
        'url': 'https://stream3.camara.gov.br/tv1/manifest.m3u8',
        'icon': 'assets/images/camara.png',
      },
    ],
    '🇵🇹 Portugueses': [
      {
        'nome': 'TV Brasil',
        'url': 'https://playertv.ebc.com.br/live/1.m3u8',
        'icon': 'assets/images/tv_brasil.png',
      },
      {
        'nome': 'TV Senado',
        'url': 'https://stream3.camara.gov.br/tv2/manifest.m3u8',
        'icon': 'assets/images/tv_senado.png',
      },
    ],
    '🏟️ Desporto': [
      {
        'nome': 'Red Bull TV',
        'url': 'https://rbmn-live.akamaized.net/hls/live/590964/BoRB/index.m3u8',
        'icon': 'assets/images/redbull.png',
      },
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV Legal'),
        centerTitle: true,
      ),
      body: ListView(
        children: canaisPorCategoria.entries.map((categoria) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 0, 8),
                child: Text(
                  categoria.key,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ...categoria.value.map((canal) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(canal['icon']!),
                    backgroundColor: Colors.grey[200],
                  ),
                  title: Text(canal['nome']!),
                  trailing: Icon(Icons.play_circle_fill),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PlayerPage(
                          canalNome: canal['nome']!,
                          canalUrl: canal['url']!,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              Divider(),
            ],
          );
        }).toList(),
      ),
    );
  }
}
