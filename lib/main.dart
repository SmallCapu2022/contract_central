import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'pages/home_page.dart';
import 'pages/auth_page.dart';

// Remplace avec les configurations de ton application
import 'firebase_options.dart'; // Ce fichier est généré lors de l'ajout d'une application Firebase

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    // Initialise Firebase avec la configuration spécifique à l'application
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    runApp(MyApp());
  } catch (e) {
    print("Erreur d'initialisation de Firebase: $e");
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return AuthPage();
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      routes: {
        '/home': (context) => HomePage(),
        '/auth': (context) => AuthPage(),
      },
    );
  }
}
