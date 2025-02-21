import 'package:app/core/errors/exceptions.dart';
import 'package:app/data/datasources/user_remote_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockUser extends Mock implements User {}

class MockUserCredential extends Mock implements UserCredential {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

void main() {
  late UserRemoteDatasource userRemoteDatasource;
  late FirebaseAuth firebaseAuth;
  late FirebaseFirestore firebaseFirestore;
  late User user;
  late DocumentSnapshot documentSnapshot;

  setUp(
    () {
      firebaseAuth = MockFirebaseAuth();
      firebaseFirestore = MockFirebaseFirestore();
      user = MockUser();
      documentSnapshot = MockDocumentSnapshot();
      userRemoteDatasource = UserRemoteDatasourceImpl(firebaseAuth, firebaseFirestore);
    },
  );

  group(
    'createUser',
    () {
      test(
        'should successfully create a user',
        () async {
          // Arrange
          when(() => firebaseAuth.createUserWithEmailAndPassword(
                email: any(named: 'email'),
                password: any(named: 'password'),
              )).thenAnswer(
            (_) async => MockUserCredential(),
          );

          when(
            () => firebaseAuth.signOut(),
          ).thenAnswer(
            (_) async {},
          );

          // Act
          await userRemoteDatasource.createUser(
            email: 'test@test.com',
            password: 'password',
          );

          // Assert
          verify(
            () => firebaseAuth.createUserWithEmailAndPassword(
              email: 'test@test.com',
              password: 'password',
            ),
          ).called(1);

          verify(() => firebaseAuth.signOut()).called(1);
        },
      );

      test(
        'should throw FirebaseServerException on failure',
        () async {
          // Arrange
          when(() => firebaseAuth.createUserWithEmailAndPassword(
                email: any(named: 'email'),
                password: any(named: 'password'),
              )).thenThrow(
            FirebaseAuthException(code: 'error'),
          );

          // Act & Assert
          expect(
            () => userRemoteDatasource.createUser(email: 'test@test.com', password: 'password'),
            throwsA(isA<FirebaseServerException>()),
          );
        },
      );
    },
  );

  group(
    'saveUser',
    () {
      test(
        'should successfully save user data',
        () async {
          // Arrange
          when(() => firebaseAuth.currentUser).thenReturn(user);
          when(() => user.uid).thenReturn('uid');
          when(() => firebaseFirestore.collection('users').doc('uid').set(any())).thenAnswer(
            (_) async {},
          );

          // Act
          await userRemoteDatasource.saveUser(
            firstName: 'John',
            lastName: 'Doe',
            email: 'john.doe@example.com',
            phoneNumber: '123456789',
            address: '123 Street',
          );

          // Assert
          verify(() => firebaseFirestore.collection('users').doc('uid').set(any())).called(1);
        },
      );

      test(
        'should throw FirebaseServerException when no user is authenticated',
        () async {
          // Arrange
          when(() => firebaseAuth.currentUser).thenReturn(null);

          // Act & Assert
          expect(
            () => userRemoteDatasource.saveUser(
              firstName: 'John',
              lastName: 'Doe',
              email: 'john.doe@example.com',
              phoneNumber: '123456789',
              address: '123 Street',
            ),
            throwsA(isA<FirebaseServerException>()),
          );
        },
      );
    },
  );

  // group(
  //   'getUser',
  //   () {
  //     test(
  //       'should successfully retrieve user data',
  //       () async {
  //         // Arrange
  //         when(() => firebaseAuth.currentUser).thenReturn(user);
  //
  //         when(
  //           () => firebaseFirestore.collection('users').doc(user.uid).get(),
  //         ).thenAnswer(
  //           (_) async => documentSnapshot,
  //         );
  //
  //         when(() => documentSnapshot.exists).thenReturn(true);
  //
  //         when(() => documentSnapshot.data()).thenReturn(
  //           {'id': 'uid'},
  //         );
  //
  //         // Act
  //         final result = await userRemoteDatasource.getUser();
  //
  //         // Assert
  //         expect(result, isA<UserModel>());
  //       },
  //     );
  //
  //     test(
  //       'should throw FirebaseServerException when no user is authenticated',
  //       () async {
  //         // Arrange
  //         when(() => firebaseAuth.currentUser).thenReturn(null);
  //
  //         // Act & Assert
  //         expect(() => userRemoteDatasource.getUser(), throwsA(isA<FirebaseServerException>()));
  //       },
  //     );
  //
  //     test(
  //       'should throw FirebaseServerException when user data is not found',
  //       () async {
  //         // Arrange
  //         when(() => firebaseAuth.currentUser).thenReturn(user);
  //         when(() => user.uid).thenReturn('uid');
  //         when(() => firebaseFirestore.collection('users').doc('uid').get()).thenAnswer(
  //           (_) async => documentSnapshot,
  //         );
  //         when(() => documentSnapshot.exists).thenReturn(false);
  //
  //         // Act & Assert
  //         expect(() => userRemoteDatasource.getUser(), throwsA(isA<FirebaseServerException>()));
  //       },
  //     );
  //   },
  // );

  group(
    'updateUser',
    () {
      test(
        'should successfully update user data',
        () async {
          // Arrange
          when(() => firebaseAuth.currentUser).thenReturn(user);

          when(() => user.uid).thenReturn('uid');

          when(
            () => firebaseFirestore.collection('users').doc('uid').update(any()),
          ).thenAnswer(
            (_) async {},
          );

          // Act
          await userRemoteDatasource.updateUser(
            firstName: 'Jane',
            lastName: 'Doe',
            email: 'jane.doe@example.com',
            phoneNumber: '987654321',
            address: '456 Avenue',
          );

          // Assert
          verify(() => firebaseFirestore.collection('users').doc('uid').update(any())).called(1);
        },
      );

      test(
        'should throw FirebaseServerException when no user is authenticated',
        () async {
          // Arrange
          when(() => firebaseAuth.currentUser).thenReturn(null);

          // Act & Assert
          expect(
            () => userRemoteDatasource.updateUser(
              firstName: 'Jane',
              lastName: 'Doe',
              email: 'jane.doe@example.com',
              phoneNumber: '987654321',
              address: '456 Avenue',
            ),
            throwsA(isA<FirebaseServerException>()),
          );
        },
      );
    },
  );
}
