<<<<<<< HEAD
// lista de canais
=======
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TV Legal')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/player'),
              child: Text('Ver Canais'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/feedback'),
              child: Text('Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}
>>>>>>> 7e09536 (Primeiro commit do app TV Legal)
