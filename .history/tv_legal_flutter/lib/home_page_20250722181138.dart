import 'package:flutter/material.dart';
import 'player_page.dart';

class HomePage extends StatelessWidget {
  final Map<String, List<Map<String, String>>> canaisPorCategoria = {
    'Notícias': [
      {
        'nome': 'Al Jazeera',
        'url': 'https://live-hls-web-aje.getaj.net/AJE/index.m3u8',
        'icon': '', // Sem imagem online por enquanto
      },
      {
        'nome': 'TV Câmara',
        'url': 'https://stream3.camara.gov.br/tv1/manifest.m3u8',
        'icon': '', // Sem imagem online por enquanto
      },
    ]
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
                leading: Icon(Icons.tv, color: Colors.blue),
                title: Text(canal['nome'] ?? 'Sem nome'),
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
