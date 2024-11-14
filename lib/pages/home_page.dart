import 'package:flutter/material.dart';
import 'chatbot_page.dart'; // Import de la ChatbotPage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    Center(child: Text('Page d\'accueil')),
    Center(child: Text('Page de profil')),
    Center(child: Text('Paramètres')),
  ];

  // Fonction pour gérer la navigation dans le BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Fonction pour ouvrir la ChatbotPage
  void _openChatbot() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatbotPage()), // Ouvre ChatbotPage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: _pages[_selectedIndex], // Affiche la page en fonction de l'index sélectionné
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      // Le bouton flottant pour lancer le Chatbot
      floatingActionButton: FloatingActionButton(
        onPressed: _openChatbot,  // Ouvre ChatbotPage quand appuyé
        child: Icon(Icons.chat),  // Icône de chat
        tooltip: 'Ouvrir le Chatbot',
      ),
    );
  }
}
