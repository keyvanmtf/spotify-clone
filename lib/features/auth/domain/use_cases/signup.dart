import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/features/auth/data/models/create_user_req.dart';
import 'package:spotify_clone/features/auth/domain/repositories/auth.dart';
import 'package:spotify_clone/locator.dart';

class SignupUseCase implements Usecase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    if (params == null) {
      throw ArgumentError('params cannot be null');
    }
    return sl<AuthRepository>().signUp(params);
  }
}
