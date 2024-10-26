import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/configs/assets/app_vecctors.dart';
import 'package:spotify_clone/core/widgets/app_bar.dart';
import 'package:spotify_clone/core/widgets/basic_button.dart';
import 'package:spotify_clone/features/auth/data/models/create_user_req.dart';
import 'package:spotify_clone/features/auth/domain/use_cases/signup.dart';
import 'package:spotify_clone/features/auth/presentation/pages/sign_in.dart';
import 'package:spotify_clone/features/home/presentation/pages/home.dart';
import 'package:spotify_clone/locator.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _fullName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              const SizedBox(
                height: 20,
              ),
              _fullNamedField(context),
              const SizedBox(height: 20),
              _emailField(context),
              const SizedBox(height: 20),
              _passwordField(context),
              const SizedBox(height: 20),
              BasicBtn(
                onPressed: () => _signup(context),
                title: "ثبت نام",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      "ثبت نام",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }

  Widget _fullNamedField(BuildContext context) {
    return TextField(
        controller: _fullName,
        decoration: const InputDecoration(
          hintText: "نام کامل",
        ).applyDefaults(Theme.of(context).inputDecorationTheme));
  }

  Widget _emailField(BuildContext context) {
    return TextField(
        controller: _email,
        decoration: const InputDecoration(
          hintText: "ایمیل",
        ).applyDefaults(Theme.of(context).inputDecorationTheme));
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
        controller: _password,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: "پسورد",
        ).applyDefaults(Theme.of(context).inputDecorationTheme));
  }

  Widget _signText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "حساب کاربری دارید؟",
            style: TextStyle(fontSize: 14),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignIn()));
              },
              child: const Text("ورود"))
        ],
      ),
    );
  }

  Future<void> _signup(BuildContext context) async {
    try {
      var result = await sl<SignupUseCase>().call(
        params: CreateUserReq(
          fullName: _fullName.text.toString(),
          email: _email.text.toString(),
          password: _password.text.toString(),
        ),
      );

      result.fold(
        (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.red,
            ),
          );
        },
        (success) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const HomePage()),
            (route) => false,
          );
        },
      );
    } catch (e) {
      print("Unexpected error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("خطای غیرمنتظره. لطفاً دوباره تلاش کنید."),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
