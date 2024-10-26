import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/core/bloc/favorite_button_state.dart';
import 'package:spotify_clone/features/home/domain/use_cases/add_remove_favorite_song,.dart';
import 'package:spotify_clone/locator.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  Future<void> favoriteButtonUpdated(String songId) async {
    var result =
        await sl<AddORRemoveFavoriteSongUseCase>().call(params: songId);
    result.fold(
      (l) {
        print('error');
      },
      (isFavorite) {
        emit(FavoriteButtonUpdated(isFavorite: isFavorite));
      },
    );
  }
}
