import 'package:dartz/dartz.dart';
import 'package:spotify_clone/features/auth/data/models/create_user_req.dart';

abstract class AuthRepository {
  Future<Either> signUp(CreateUserReq createUserReq);
  Future<void> signIn();
}
