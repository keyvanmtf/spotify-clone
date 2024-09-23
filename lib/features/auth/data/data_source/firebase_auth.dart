import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/features/auth/data/models/create_user_req.dart';

abstract class AuthFireBase {
  Future<Either> signUp(CreateUserReq createUserReq);
  Future<void> signIn();
}

class AuthFireBaseImpl extends AuthFireBase {
  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
      return const Right("Signup success");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == "weak-password") {
        message = "The password provided is too weak.";
      } else if (e.code == "email-already=in=use") {
        message = "The account already exists for that email.";
      }

      return Left(message);
    }
  }
}
