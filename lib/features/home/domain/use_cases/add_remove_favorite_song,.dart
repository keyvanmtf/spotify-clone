import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/features/home/domain/repositories/song_repo.dart';
import 'package:spotify_clone/locator.dart';

class AddORRemoveFavoriteSongUseCase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<SongRepository>().addRemoveFavorite(params!);
  }
}
