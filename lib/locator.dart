import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_clone/features/auth/data/data_source/firebase_auth.dart';
import 'package:spotify_clone/features/auth/data/repository/auth_repository_impl.dart';
import 'package:spotify_clone/features/auth/domain/repositories/auth.dart';
import 'package:spotify_clone/features/auth/domain/use_cases/sign_in.dart';
import 'package:spotify_clone/features/auth/domain/use_cases/signup.dart';
import 'package:spotify_clone/features/home/data/data_source/get_songs.dart';
import 'package:spotify_clone/features/home/data/repository/song_repo_impl.dart';
import 'package:spotify_clone/features/home/domain/repositories/song_repo.dart';
import 'package:spotify_clone/features/home/domain/use_cases/add_remove_favorite_song,.dart';
import 'package:spotify_clone/features/home/domain/use_cases/get_playlist.dart';
import 'package:spotify_clone/features/home/domain/use_cases/get_songs.dart';
import 'package:spotify_clone/features/home/domain/use_cases/is_favorite_song.dart';

final sl = GetIt.instance;

Future<void> initilizeDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  sl.registerSingleton<FirebaseAuth>(firebaseAuth);
  sl.registerSingleton<SharedPreferences>(sharedPreferences);
  sl.registerSingleton<AuthFireBase>(AuthFireBaseImpl());
  // sl.registerSingleton<SharePrefFireBase>(SharePrefFireBaseImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  // sl.registerSingleton<SharePrefRepository>(SharePrefRepositoryImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  // sl.registerSingleton<LoginUseCase>(LoginUseCase());
  sl.registerSingleton<SongFireBase>(SongfireBaseImpl());
  sl.registerSingleton<SongRepository>(SongRepositoryImpl());
  sl.registerSingleton<getSongsUseCase>(getSongsUseCase());
  sl.registerSingleton<AddORRemoveFavoriteSongUseCase>(
      AddORRemoveFavoriteSongUseCase());
  sl.registerSingleton<IsFavoriteSongUseCase>(IsFavoriteSongUseCase());
  sl.registerSingleton<getPlayListUseCase>(getPlayListUseCase());
}
