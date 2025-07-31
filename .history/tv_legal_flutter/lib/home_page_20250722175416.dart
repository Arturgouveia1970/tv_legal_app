import 'package:flutter/material.dart';
import 'player_page.dart';

class HomePage extends StatelessWidget {
  final Map<String, List<Map<String, String>>> canaisPorCategoria = {
    '📰 Notícias': [
      {
        'nome': 'Al Jazeera',
        'url': 'https://live-hls-web-aje.getaj.net/AJE/index.m3u8',
      },
      {
        'nome': 'France 24',
        'url': 'https://static.france24.com/live/F24_EN_LO_HLS/live_web.m3u8',
      },
      {
        'nome': 'DW',
        'url': 'https://dwstream4-lh.akamaihd.net/i/dwstream4_live@124556/index_1_av-p.m3u8',
      },
    ],
    '🏆 Desporto': [
      {
        'nome': 'Red Bull TV',
        'url': 'https://rbmn-live.akamaized.net/hls/live/590964/BoRB-AT/master_3840.m3u8',
      },
      {
        'nome': 'Edge Sport',
        'url': 'https://edgesport-samsung-uk.amagi.tv/playlist.m3u8',
      },
      {
        'nome': 'Fight Network',
        'url': 'https://dai2.xumo.com/amagi_hls_data_xumo1212A-redboxfightnetwork/CDN/playlist.m3u8',
      },
    ],
    '🌍 Cultura / Ciência': [
      {
        'nome': 'NASA TV',
        'url': 'https://nasatv-lh.akamaihd.net/i/NASA_101@319270/master.m3u8',
      },
    ],
    '🗣️ PT / BR': [
      {
        'nome': 'TV Brasil',
        'url': 'https://tvbrasil.akamaized.net/hls/live/2016716/TVBrasil/master.m3u8',
      },
      {
        'nome': 'TV Câmara',
        'url': 'https://stream3.camara.gov.br/tv1/manifest.m3u8',
      },
      {
        'nome': 'TV Senado',
        'url': 'https://stream3.camara.gov.br/tv2/manifest.m3u8',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TV Legal')),
      body: ListView(
        children: canaisPorCategoria.entries.map((categoria) {
          return ExpansionTile(
            title: Text(categoria.key, style: TextStyle(fontWeight: FontWeight.bold)),
            children: categoria.value.map((canal) {
              return ListTile(
                title: Text(canal['nome']!),
                trailing: Icon(Icons.play_circle),
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
          );
        }).toList(),
      ),
    );
  }
}
