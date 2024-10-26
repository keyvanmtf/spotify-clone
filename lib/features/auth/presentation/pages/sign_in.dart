import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/configs/assets/app_vecctors.dart';
import 'package:spotify_clone/core/widgets/app_bar.dart';
import 'package:spotify_clone/core/widgets/basic_button.dart';
import 'package:spotify_clone/features/auth/data/models/signin_user_req.dart';
import 'package:spotify_clone/features/auth/domain/use_cases/sign_in.dart';
import 'package:spotify_clone/features/auth/presentation/pages/signup.dart';
import 'package:spotify_clone/features/home/presentation/pages/home.dart';
import 'package:spotify_clone/locator.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  // final FirebaseAuth _auth = sl<FirebaseAuth>();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signInText(),
            const SizedBox(
              height: 20,
            ),
            _emailField(context),
            const SizedBox(height: 20),
            _passwordField(context),
            const SizedBox(height: 20),
            BasicBtn(
              onPressed: () => _signIn(context),
              title: " ورود",
            ),
          ],
        ),
      ),
    );
  }

  Widget _signInText() {
    return const Text(
      "ورود",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
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
            "عضو نیستید؟",
            style: TextStyle(fontSize: 14),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignUp()));
              },
              child: const Text("ثبت نام"))
        ],
      ),
    );
  }

  Future<void> _signIn(BuildContext context) async {
    // User? user = _auth.currentUser;
    try {
      var result = await sl<SignInUseCase>().call(
        params: SigninUserReq(
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
          try {
            // if (user != null) {
            // کاربر لاگین شده است، او را به صفحه Home هدایت کنید
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const HomePage()),
              (route) => false,
            );
            // } else {
            // کاربر لاگین نشده است، او را به صفحه Login هدایت کنید
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => const SignUpSignIn()),
            // );
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("shared prefence dont work!"),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.red,
              ),
            );
          }
        },
      );
    } catch (e) {
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
