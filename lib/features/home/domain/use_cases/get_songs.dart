import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/features/home/domain/entities/song/song_entity.dart';
import 'package:spotify_clone/features/home/domain/repositories/song_repo.dart';
import 'package:spotify_clone/locator.dart';

class getSongsUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either<String, List<SongEntity>>> call({dynamic params}) async {
    // حذف بررسی params
    return await sl<SongRepository>().getSongs();
  }
}
