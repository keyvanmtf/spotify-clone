import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/configs/assets/app_vecctors.dart';
import 'package:spotify_clone/core/widgets/app_bar.dart';
import 'package:spotify_clone/features/home/presentation/widgets/home_artist_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeArtistCard(),
          ],
        ),
      ),
    );
  }
}
