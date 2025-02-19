import 'package:app/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDatasource {
  Future<void> loginUser({required String email, required String password});

  Future<void> logoutUser();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  const AuthRemoteDatasourceImpl(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  Future<void> loginUser({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw ServerException(
        message: 'Error : $e',
        statusCode: 500,
      );
    }
  }

  @override
  Future<void> logoutUser() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw ServerException(
        message: 'Error : $e',
        statusCode: 500,
      );
    }
  }
}
