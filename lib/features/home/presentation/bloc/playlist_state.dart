import 'package:spotify_clone/features/home/domain/entities/song/song_entity.dart';

abstract class PlayListState {}

class PlayListLoading extends PlayListState {}

class PlayListLoaded extends PlayListState {
  final List<SongEntity> songs;

  PlayListLoaded({required this.songs});
}

class PlayListError extends PlayListState {
  final String message;

  PlayListError({required this.message});
}
