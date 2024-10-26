import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/core/bloc/favorite_button_cubit.dart';
import 'package:spotify_clone/core/bloc/favorite_button_state.dart';
import 'package:spotify_clone/core/utils/is_dark_mode.dart';
import 'package:spotify_clone/features/home/domain/entities/song/song_entity.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntity songEntity;
  final Function? function;
  const FavoriteButton({required this.songEntity, this.function, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
        builder: (context, state) {
          if (state is FavoriteButtonInitial) {
            return IconButton(
                onPressed: () async {
                  await context
                      .read<FavoriteButtonCubit>()
                      .favoriteButtonUpdated(songEntity.songId);
                  if (function != null) {
                    function!();
                  }
                },
                icon: Icon(
                  songEntity.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_outline_outlined,
                  size: 25,
                  color: context.isDarkMode ? Colors.white : Colors.grey,
                ));
          }

          if (state is FavoriteButtonUpdated) {
            return IconButton(
                onPressed: () {
                  context
                      .read<FavoriteButtonCubit>()
                      .favoriteButtonUpdated(songEntity.songId);
                },
                icon: Icon(
                  state.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_outline_outlined,
                  size: 25,
                  color: const Color.fromARGB(155, 52, 52, 52),
                ));
          }

          return Container();
        },
      ),
    );
  }
}
