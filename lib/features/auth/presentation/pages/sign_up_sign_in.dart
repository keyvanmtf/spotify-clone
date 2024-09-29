import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/configs/assets/app_images.dart';
import 'package:spotify_clone/configs/assets/app_vecctors.dart';
import 'package:spotify_clone/configs/theme/app_colors.dart';
import 'package:spotify_clone/core/utils/is_dark_mode.dart';
import 'package:spotify_clone/core/widgets/app_bar.dart';
import 'package:spotify_clone/core/widgets/basic_button.dart';
import 'package:spotify_clone/features/auth/presentation/pages/sign_in.dart';
import 'package:spotify_clone/features/auth/presentation/pages/signup.dart';

class SignUpSignIn extends StatelessWidget {
  const SignUpSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),

          //image auth
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBG),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppVectors.logo),
                const SizedBox(height: 20),
                Text(
                  "از موسیقی لذت ببر",
                  style: TextStyle(
                      color: context.isDarkMode
                          ? Colors.white
                          : appColors.darkGrey,
                      fontSize: 26),
                ),
                const SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  "با اسپاتیفای فارسی همه ی\n موزیک ها رو گوش کن ",
                  style: TextStyle(
                      color: context.isDarkMode
                          ? Colors.white
                          : appColors.darkGrey,
                      fontSize: 17),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: BasicBtn(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SignUp()));
                          },
                          title: "ثبت نام"),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => SignIn()));
                        },
                        child: Text(
                          "ورود",
                          style: TextStyle(
                              fontSize: 16,
                              color: context.isDarkMode
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
