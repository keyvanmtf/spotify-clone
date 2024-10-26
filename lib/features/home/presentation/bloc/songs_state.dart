import 'package:spotify_clone/features/home/domain/entities/song/song_entity.dart';

abstract class SongsState {}

class NewSongsLoading extends SongsState {}

class NewSongsLoaded extends SongsState {
  final List<SongEntity> songs;

  NewSongsLoaded({required this.songs});
}

class NewSongsError extends SongsState {
  final String message;

  NewSongsError({required this.message});
}
