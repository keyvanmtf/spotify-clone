import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/features/auth/data/models/signin_user_req.dart';
import 'package:spotify_clone/features/auth/domain/repositories/auth.dart';
import 'package:spotify_clone/locator.dart';

class SignInUseCase implements Usecase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    if (params == null) {
      throw ArgumentError('params cannot be null');
    }
    return sl<AuthRepository>().signIn(params);
  }
}
