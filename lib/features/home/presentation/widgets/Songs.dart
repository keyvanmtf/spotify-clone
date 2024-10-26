import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/configs/theme/app_colors.dart';
import 'package:spotify_clone/core/const/image_url.dart';
import 'package:spotify_clone/core/utils/is_dark_mode.dart';
import 'package:spotify_clone/features/home/domain/entities/song/song_entity.dart';
import 'package:spotify_clone/features/home/presentation/bloc/songs_cubit.dart';
import 'package:spotify_clone/features/home/presentation/bloc/songs_state.dart';
import 'package:spotify_clone/features/song%20player/presentaion/pages/song_palyer.dart';

class NewSongs extends StatelessWidget {
  const NewSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SongsCubit()..fetchSongs(),
      child: SizedBox(
          height: 200,
          child: BlocBuilder<SongsCubit, SongsState>(
            builder: (context, state) {
              if (state is NewSongsLoading) {
                return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator());
              }

              if (state is NewSongsLoaded) {
                return _songs(state.songs);
              }
              if (state is NewSongsError) {
                return Center(child: Text(state.message));
              }

              return Container();
            },
          )),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SongPlayerPage(
                            songEntity: songs[index],
                          )));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: 160,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "${imageUrl.coverfireStorage}${songs[index].title}_${songs[index].artist}.jpg?${imageUrl.mediaAlt}"),
                          ),
                        ),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 40,
                              width: 40,
                              transform: Matrix4.translationValues(10, 10, 0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context.isDarkMode
                                    ? appColors.darkGrey
                                    : Colors.white,
                              ),
                              child: Icon(Icons.play_arrow_rounded,
                                  color: context.isDarkMode
                                      ? Colors.white
                                      : appColors.darkGrey),
                            )),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      songs[index].title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      songs[index].artist,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 40,
          );
        },
        itemCount: songs.length);
  }
}
