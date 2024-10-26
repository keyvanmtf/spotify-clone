import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify_clone/features/song%20player/presentaion/bloc/song_playe_state.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration? songDuration = Duration.zero;
  Duration? songPosition = Duration.zero;
  SongPlayerCubit() : super(SongPlayeLoading()) {
    audioPlayer.positionStream.listen((position) {
      songPosition = position;
      updateSongPlayer();
    });
    audioPlayer.durationStream.listen((duration) {
      songDuration = duration;
    });
  }
  void updateSongPlayer() {
    emit(SongPlayeLoaded());
  }

  Future<void> loadSong(String url) async {
    try {
      await audioPlayer.setUrl(url);
      emit(SongPlayeLoaded());
    } catch (e) {
      emit(SongPlayeError());
    }
  }

  void seekTo(Duration position) {
    audioPlayer.seek(position);
  }

  void playOrPauseSong() {
    if (audioPlayer.playing) {
      audioPlayer.stop();
    } else {
      audioPlayer.play();
    }
    emit(SongPlayeLoaded());
  }

  @override
  Future<void> close() async {
    super.close();
    audioPlayer.dispose();
  }
}
