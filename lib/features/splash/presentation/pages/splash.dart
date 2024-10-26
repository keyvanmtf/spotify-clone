import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/configs/assets/app_vecctors.dart';
import 'package:spotify_clone/features/auth/presentation/pages/sign_up_sign_in.dart';
import 'package:spotify_clone/features/home/presentation/pages/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    checkLogin();
  }

  void checkLogin() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        // کاربر لاگین کرده است، به صفحه اصلی هدایت کنید
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        // کاربر لاگین نکرده است، به صفحه ورود هدایت کنید
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignUpSignIn()),
        );
      }
    });
  }

  // Future<void> redirect() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Navigator.pushReplacement(context,
  //       MaterialPageRoute(builder: (BuildContext context) => const Intro()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppVectors.logo),
      ),
    );
  }
}
