import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/configs/theme/app_theme.dart';
import 'package:spotify_clone/features/splash/presentation/pages/splash.dart';
import 'package:spotify_clone/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB3r6GrjgChyXJLO1rfR_P3WEw41oBs2VQ",
          authDomain: "spotify-clone-d906b.firebaseapp.com",
          projectId: "spotify-clone-d906b",
          storageBucket: "spotify-clone-d906b.appspot.com",
          messagingSenderId: "689928277089",
          appId: "1:689928277089:web:5436b810d4740e532dee20"),
    );
  } else {
    await Firebase.initializeApp();
  }
  await initilizeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
    );
  }
}
