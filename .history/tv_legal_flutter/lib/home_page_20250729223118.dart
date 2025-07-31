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
      'title': 'DW News',
      'url': 'https://dwamdstream102.akamaized.net/hls/live/2015525/dwstream102/index.m3u8',
      'icon': 'assets/images/dw.png',
      'category': 'News'
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
      appBar: AppBar(
        title: Text('TV Legal'),
        centerTitle: true,
        elevation: 2,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: categorias.map((categoria) {
          final filtrados = canais.where((c) => c['category'] == categoria).toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  categoria,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple, // ✅ Accent color for headers
                  ),
                ),
              ),
              ...filtrados.map((canal) {
                return Card(
                  color: Colors.white, // ✅ Light card background
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        canal['icon'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Icon(Icons.tv, color: Colors.grey),
                      ),
                    ),
                    title: Text(
                      canal['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87, // ✅ Visible text
                      ),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayerPage(
                          canalNome: canal['title'],
                          canalUrl: canal['url'],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          );
        }).toList(),
      ),
    );
  }
}
