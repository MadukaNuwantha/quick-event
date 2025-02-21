import 'package:app/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDatasource {
  Future<UserCredential?> loginUser({required String email, required String password});

  Future<void> logoutUser();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  const AuthRemoteDatasourceImpl(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  Future<UserCredential?> loginUser({required String email, required String password}) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw FirebaseServerException(
        message: 'Error : $e',
      );
    }
  }

  @override
  Future<void> logoutUser() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw FirebaseServerException(
        message: 'Error : $e',
      );
    }
  }
}
