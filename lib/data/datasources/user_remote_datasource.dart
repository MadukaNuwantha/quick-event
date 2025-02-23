import 'package:app/core/errors/exceptions.dart';
import 'package:app/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRemoteDatasource {
  Future<UserModel> getUser();

  Future<void> createUser({required String email, required String password});

  Future<void> saveUser({
    required firstName,
    required lastName,
    required email,
    required phoneNumber,
    required address,
  });

  Future<void> updateUser({
    required firstName,
    required lastName,
    required email,
    required phoneNumber,
    required address,
  });
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  const UserRemoteDatasourceImpl(this._firebaseAuth, this._firebaseFirestore);

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<void> createUser({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firebaseAuth.signOut();
    } on FirebaseServerException {
      rethrow;
    } catch (e) {
      throw FirebaseServerException(
        message: 'Error : $e',
      );
    }
  }

  @override
  Future<void> saveUser({
    required firstName,
    required lastName,
    required email,
    required phoneNumber,
    required address,
  }) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        await _firebaseFirestore.collection('users').doc(user.uid).set({
          'id': user.uid,
          'email': email,
          'firstName': firstName,
          'lastName': lastName,
          'phoneNumber': phoneNumber,
          'address': address,
        });
      } else {
        throw FirebaseServerException(
          message: 'No authenticated user found',
        );
      }
    } on FirebaseServerException {
      rethrow;
    } catch (e) {
      throw FirebaseServerException(
        message: 'Error : $e',
      );
    }
  }

  @override
  Future<UserModel> getUser() async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        DocumentSnapshot doc = await _firebaseFirestore.collection('users').doc(user.uid).get();
        if (doc.exists) {
          return UserModel.fromMap(doc.data() as Map<String, dynamic>);
        } else {
          throw FirebaseServerException(
            message: 'User data not found',
          );
        }
      } else {
        throw FirebaseServerException(
          message: 'No authenticated user found',
        );
      }
    } on FirebaseServerException {
      rethrow;
    } catch (e) {
      throw FirebaseServerException(
        message: 'Error : $e',
      );
    }
  }

  @override
  Future<void> updateUser({
    required firstName,
    required lastName,
    required email,
    required phoneNumber,
    required address,
  }) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        await _firebaseFirestore.collection('users').doc(user.uid).update({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'phoneNumber': phoneNumber,
          'address': address,
        });
      } else {
        throw FirebaseServerException(
          message: 'No authenticated user found',
        );
      }
    } on FirebaseServerException {
      rethrow;
    } catch (e) {
      throw FirebaseServerException(
        message: 'Error : $e',
      );
    }
  }
}
