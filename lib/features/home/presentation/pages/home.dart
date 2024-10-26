import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/configs/assets/app_vecctors.dart';
import 'package:spotify_clone/core/widgets/app_bar.dart';
import 'package:spotify_clone/features/home/presentation/widgets/Songs.dart';
import 'package:spotify_clone/features/home/presentation/widgets/home_artist_card.dart';
import 'package:spotify_clone/features/home/presentation/widgets/playlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeArtistCard(),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 260,
              child: TabBarView(
                controller: _tabController,
                children: const [NewSongs()],
              ),
            ),
            const PlayList()
          ],
        ),
      ),
    );
  }
}
