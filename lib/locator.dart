import 'package:get_it/get_it.dart';
import 'package:spotify_clone/features/auth/data/data_source/firebase_auth.dart';
import 'package:spotify_clone/features/auth/data/repository/auth_repository_impl.dart';
import 'package:spotify_clone/features/auth/domain/repositories/auth.dart';
import 'package:spotify_clone/features/auth/domain/use_cases/sign_in.dart';
import 'package:spotify_clone/features/auth/domain/use_cases/signup.dart';

final sl = GetIt.instance;

Future<void> initilizeDependencies() async {
  sl.registerSingleton<AuthFireBase>(AuthFireBaseImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
}
