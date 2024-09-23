import 'package:dartz/dartz.dart';
import 'package:spotify_clone/features/auth/data/data_source/firebase_auth.dart';
import 'package:spotify_clone/features/auth/data/models/create_user_req.dart';
import 'package:spotify_clone/features/auth/domain/repositories/auth.dart';
import 'package:spotify_clone/locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either> signUp(CreateUserReq CreateUserReq) async {
    return await sl<AuthFireBase>().signUp(CreateUserReq);
  }
}
