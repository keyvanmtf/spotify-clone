import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/features/auth/data/models/create_user_req.dart';
import 'package:spotify_clone/features/auth/data/models/signin_user_req.dart';

abstract class AuthFireBase {
  Future<Either<String, String>> signUp(CreateUserReq createUserReq);
  Future<Either<String, String>> signIn(SigninUserReq signinUserReq);
}

class AuthFireBaseImpl extends AuthFireBase {
  @override
  Future<Either<String, String>> signIn(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUserReq.email, password: signinUserReq.password);
      return const Right("ورود موفقیت‌آمیز");
    } on FirebaseAuthException catch (e) {
      return Left(_mapSignInErrorToMessage(e));
    } catch (e) {
      print("Error during sign in: $e");
      return const Left("خطای نامشخص. لطفاً دوباره تلاش کنید.");
    }
  }

  @override
  Future<Either<String, String>> signUp(CreateUserReq createUserReq) async {
    try {
      var userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: createUserReq.email, password: createUserReq.password);

      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.uid)
          .set({
        'name': createUserReq.fullName,
        'email': userCredential.user?.email,
      });

      return const Right("ثبت‌نام موفقیت‌آمیز");
    } on FirebaseAuthException catch (e) {
      return Left(_mapSignUpErrorToMessage(e));
    } catch (e) {
      print("Error during sign up: $e");
      return const Left("خطای نامشخص. لطفاً دوباره تلاش کنید.");
    }
  }

  String _mapSignInErrorToMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'آدرس ایمیل وارد شده نامعتبر است.';
      case 'user-disabled':
        return 'این حساب کاربری غیرفعال شده است.';
      case 'user-not-found':
        return 'کاربری با این ایمیل یافت نشد.';
      case 'wrong-password':
        return 'رمز عبور وارد شده اشتباه است.';
      case 'too-many-requests':
        return 'تعداد زیادی تلاش ناموفق انجام شده است. لطفاً بعداً دوباره تلاش کنید.';
      case 'network-request-failed':
        return 'اتصال به اینترنت برقرار نشد. لطفاً اتصال اینترنت خود را بررسی کنید.';
      default:
        return 'خطای ورود. لطفاً دوباره تلاش کنید.';
    }
  }

  String _mapSignUpErrorToMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'این ایمیل قبلاً استفاده شده است. لطفاً ایمیل دیگری وارد کنید.';
      case 'invalid-email':
        return 'آدرس ایمیل وارد شده نامعتبر است.';
      case 'weak-password':
        return 'رمز عبور بسیار ضعیف است. لطفاً رمز عبور قوی‌تری وارد کنید.';
      case 'operation-not-allowed':
        return 'ثبت‌نام با ایمیل و رمز عبور غیرفعال است.';
      case 'network-request-failed':
        return 'اتصال به اینترنت برقرار نشد. لطفاً اتصال اینترنت خود را بررسی کنید.';
      default:
        return 'خطای ثبت‌نام. لطفاً دوباره تلاش کنید.';
    }
  }
}
