import 'package:dartz/dartz.dart';
import 'package:spotify_clone/features/home/data/data_source/get_songs.dart';
import 'package:spotify_clone/features/home/domain/entities/song/song_entity.dart';
import 'package:spotify_clone/features/home/domain/repositories/song_repo.dart';
import 'package:spotify_clone/locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either<String, List<SongEntity>>> getSongs() async {
    return await sl<SongFireBase>().getSongs();
  }

  @override
  Future<Either<String, List<SongEntity>>> getPlaylist() async {
    return await sl<SongFireBase>().getPlayList();
  }

  @override
  Future<Either> addRemoveFavorite(String songId) async {
    return await sl<SongFireBase>().addRemoveFavoriteSong(songId);
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    return await sl<SongFireBase>().isFavoriteSong(songId);
  }
}
