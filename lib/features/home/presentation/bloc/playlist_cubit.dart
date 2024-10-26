import 'package:bloc/bloc.dart';
import 'package:spotify_clone/features/home/domain/use_cases/get_playlist.dart';
import 'package:spotify_clone/features/home/presentation/bloc/playlist_state.dart';
import 'package:spotify_clone/locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    try {
      print("Fetching songs...");
      var returnedSongs = await sl<getPlayListUseCase>().call(params: null);

      returnedSongs.fold((error) {
        print("Error: $error");
        emit(PlayListError(message: error));
      }, (songs) {
        print("Songs loaded: ${songs.length}");
        emit(PlayListLoaded(songs: songs));
      });
    } catch (e) {
      print("Exception in fetchSongs: $e");
      emit(PlayListError(message: "Unexpected error occurred"));
    }
  }
}
