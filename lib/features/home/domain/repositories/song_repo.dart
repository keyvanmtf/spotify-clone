import 'package:dartz/dartz.dart';
import 'package:spotify_clone/features/home/domain/entities/song/song_entity.dart';

abstract class SongRepository {
  Future<Either<String, List<SongEntity>>> getSongs();
  Future<Either<String, List<SongEntity>>> getPlaylist();
  Future<Either> addRemoveFavorite(String songId);
  Future<bool> isFavoriteSong(String songId);
}
