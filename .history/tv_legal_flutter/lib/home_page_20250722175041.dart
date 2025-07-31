import 'package:flutter/material.dart';
import 'player_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> canais = [
    {
    'nome': 'Al Jazeera',
    'url': 'https://live-hls-web-aje.getaj.net/AJE/index.m3u8',
  },
  {
    'nome': 'France 24',
    'url': 'https://static.france24.com/live/F24_EN_LO_HLS/live_web.m3u8',
  },
  {
    'nome': 'NASA TV',
    'url': 'https://nasatv-lh.akamaihd.net/i/NASA_101@319270/master.m3u8',
  },
  {
    'nome': 'Red Bull TV (Desporto Radical)',
    'url': 'https://rbmn-live.akamaized.net/hls/live/590964/BoRB-AT/master_3840.m3u8',
  },
  {
    'nome': 'Edge Sport (Desporto)',
    'url': 'https://edgesport-samsung-uk.amagi.tv/playlist.m3u8',
  },
  {
    'nome': 'Fight Network (Desportos de Combate)',
    'url': 'https://dai2.xumo.com/amagi_hls_data_xumo1212A-redboxfightnetwork/CDN/playlist.m3u8',
  },
  {
  'nome': 'TV Brasil (BR)',
  'url': 'https://tvbrasil.akamaized.net/hls/live/2016716/TVBrasil/master.m3u8',
  },
    {
    'nome': 'TV Câmara (BR - política e atualidades)',
    'url': 'https://stream3.camara.gov.br/tv1/manifest.m3u8',
    },
    {
    'nome': 'TV Senado (BR - política)',
    'url': 'https://stream3.camara.gov.br/tv2/manifest.m3u8',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TV Legal')),
      body: ListView.builder(
        itemCount: canais.length,
        itemBuilder: (context, index) {
          final canal = canais[index];
          return ListTile(
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
        },
      ),
    );
  }
}
