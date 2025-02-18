import 'package:app/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show DocumentSnapshot, FirebaseFirestore;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, User;

abstract class UserRemoteDatasource {
  Future<UserModel> getUser();

  Future<void> createUser({
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
  const UserRemoteDatasourceImpl(this._auth, this._firestore);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  @override
  Future<void> createUser({
    required firstName,
    required lastName,
    required email,
    required phoneNumber,
    required address,
  }) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'id': user.uid,
          'email': email,
          'firstName': firstName,
          'lastName': lastName,
          'phoneNumber': phoneNumber,
          'address': address,
        });
      } else {
        throw Exception("No authenticated user found");
      }
    } catch (e) {
      throw Exception("Failed to create user: $e");
    }
  }

  @override
  Future<UserModel> getUser() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot doc = await _firestore.collection('users').doc(user.uid).get();
        if (doc.exists) {
          return UserModel.fromJson(doc.data() as String);
        } else {
          throw Exception("User data not found");
        }
      } else {
        throw Exception("No authenticated user found");
      }
    } catch (e) {
      throw Exception("Failed to get user: $e");
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
      User? user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).update({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'phoneNumber': phoneNumber,
          'address': address,
        });
      } else {
        throw Exception("No authenticated user found");
      }
    } catch (e) {
      throw Exception("Failed to update user: $e");
    }
  }
}
