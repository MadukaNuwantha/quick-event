import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDatasource {
  Future<void> createUser({required String email, required String password});

  Future<void> loginUser({required String email, required String password});

  Future<void> logoutUser();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  const AuthRemoteDatasourceImpl(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  Future<void> createUser({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> loginUser({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> logoutUser() async {
    await _firebaseAuth.signOut();
  }
}
