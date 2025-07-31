import 'package:flutter/material.dart';
import 'player_page.dart';

class HomePage extends StatelessWidget {
  final Map<String, List<Map<String, String>>> canaisPorCategoria = {
    '📰 Notícias': [
      {
        'nome': 'Al Jazeera',
        'url': 'https://live-hls-web-aje.getaj.net/AJE/index.m3u8',
        'icon': 'https://upload.wikimedia.org/wikipedia/en/thumb/f/f7/Al_Jazeera_English_logo.svg/1200px-Al_Jazeera_English_logo.svg.png',
      },
      {
        'nome': 'France 24',
        'url': 'https://static.france24.com/live/F24_EN_LO_HLS/live_web.m3u8',
        'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/France24_Logo_2021.svg/512px-France24_Logo_2021.svg.png',
      },
    ],
    '🗣️ PT / BR': [
      {
        'nome': 'TV Câmara',
        'url': 'https://stream3.camara.gov.br/tv1/manifest.m3u8',
        'icon': 'https://www.camara.leg.br/tema/assets/images/logo-camara-horizontal.png',
      },
      {
        'nome': 'TV Senado',
        'url': 'https://stream3.camara.gov.br/tv2/manifest.m3u8',
        'icon': 'https://www12.senado.leg.br/hotsites/catalogo-multimidia/imagens/logo-tv-senado-vertical.png',
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
            title: Text(
              categoria.key,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: categoria.value.map((canal) {
              return ListTile(
                leading: canal['icon'] != null
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(canal['icon']!),
                        backgroundColor: Colors.grey[200],
                      )
                    : Icon(Icons.live_tv),
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
