import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/configs/theme/app_colors.dart';
import 'package:spotify_clone/core/utils/is_dark_mode.dart';
import 'package:spotify_clone/core/widgets/favorite_button.dart';
import 'package:spotify_clone/features/home/domain/entities/song/song_entity.dart';
import 'package:spotify_clone/features/home/presentation/bloc/playlist_cubit.dart';
import 'package:spotify_clone/features/home/presentation/bloc/playlist_state.dart';
import 'package:spotify_clone/features/song%20player/presentaion/pages/song_palyer.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PlayListCubit()..getPlayList(),
        child: BlocBuilder<PlayListCubit, PlayListState>(
            builder: (context, state) {
          if (state is PlayListLoading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }
          if (state is PlayListLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Playlists',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _songs(state.songs)
                ],
              ),
            );
          }
          if (state is PlayListError) {
            return Center(child: Text(state.message));
          }
          return Container();
        }));
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
        shrinkWrap: true,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ردیف آیکون پلی و اسم آهنگ
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.isDarkMode
                            ? appColors.darkGrey
                            : Colors.white,
                      ),
                      child: Icon(Icons.play_arrow_rounded,
                          color: context.isDarkMode
                              ? Colors.grey
                              : appColors.darkGrey),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    // بخش اسم آهنگ . خواننده به صورت عمودی
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          songs[index].title,
                          style: TextStyle(
                            fontSize: 16,
                            color: context.isDarkMode
                                ? Colors.white
                                : Colors.black38,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          songs[index].artist,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: context.isDarkMode
                                ? Colors.white
                                : Colors.black38,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                //بخش زمان آهنگ و دکمه لایک
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        songs[index].duration.toString().replaceAll(".", ":"),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      FavoriteButton(
                        songEntity: songs[index],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
        //جداکننده ی آهنگ ها به صورت عمودی
        separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
        itemCount: songs.length);
  }
}
