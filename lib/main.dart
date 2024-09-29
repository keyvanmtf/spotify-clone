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
          apiKey: "xxxxx",
          authDomain: "xxxx",
          projectId: "xxxxx",
          storageBucket: "xxxxxx",
          messagingSenderId: "xxxxx",
          appId: "1:xxxxxx"),
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
