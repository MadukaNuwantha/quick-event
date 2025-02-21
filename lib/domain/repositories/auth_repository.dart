import 'package:app/core/utils/typedef.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  const AuthRepository();

  ResultFuture<UserCredential?> loginUser({required String email, required String password});

  ResultVoid logoutUser();
}
