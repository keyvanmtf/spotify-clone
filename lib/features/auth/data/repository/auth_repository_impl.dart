import 'package:dartz/dartz.dart';
import 'package:spotify_clone/features/auth/data/data_source/firebase_auth.dart';
import 'package:spotify_clone/features/auth/data/models/create_user_req.dart';
import 'package:spotify_clone/features/auth/data/models/signin_user_req.dart';
import 'package:spotify_clone/features/auth/domain/repositories/auth.dart';
import 'package:spotify_clone/locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SigninUserReq signinUserReq) async {
    return await sl<AuthFireBase>().signIn(signinUserReq);
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    return await sl<AuthFireBase>().signUp(createUserReq);
  }
}
