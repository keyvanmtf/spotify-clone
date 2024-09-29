import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/configs/assets/app_images.dart';
import 'package:spotify_clone/configs/assets/app_vecctors.dart';

class HomeArtistCard extends StatelessWidget {
  const HomeArtistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(AppVectors.homeArtistVector)),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Image.asset(AppImages.homeArtistImage),
                ))
          ],
        ),
      ),
    );
  }
}
