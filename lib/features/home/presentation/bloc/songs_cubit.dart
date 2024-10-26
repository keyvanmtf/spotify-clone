import 'package:bloc/bloc.dart';
import 'package:spotify_clone/features/home/domain/use_cases/get_songs.dart';
import 'package:spotify_clone/features/home/presentation/bloc/songs_state.dart';
import 'package:spotify_clone/locator.dart';

class SongsCubit extends Cubit<SongsState> {
  SongsCubit() : super(NewSongsLoading());

  Future<void> fetchSongs() async {
    try {
      print("Fetching songs...");
      var returnedSongs = await sl<getSongsUseCase>().call(params: null);

      returnedSongs.fold((error) {
        print("Error: $error");
        emit(NewSongsError(message: error));
      }, (songs) {
        print("Songs loaded: ${songs.length}");
        emit(NewSongsLoaded(songs: songs));
      });
    } catch (e) {
      print("Exception in fetchSongs: $e");
      emit(NewSongsError(message: "Unexpected error occurred"));
    }
  }
}
