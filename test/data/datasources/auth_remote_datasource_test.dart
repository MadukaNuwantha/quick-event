import 'package:app/core/errors/exceptions.dart';
import 'package:app/data/datasources/auth_remote_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

void main() {
  late FirebaseAuth firebaseAuth;
  late AuthRemoteDatasource authRemoteDatasource;

  setUp(() {
    firebaseAuth = MockFirebaseAuth();
    authRemoteDatasource = AuthRemoteDatasourceImpl(firebaseAuth);
  });

  final tException = FirebaseServerException(
    message: 'Test Exception',
  );

  group(
    'loginUser',
    () {
      const email = 'test@example.com';
      const password = 'password123';

      test(
        'should call signInWithEmailAndPassword with correct email and password',
        () async {
          // Arrange
          when(
            () => firebaseAuth.signInWithEmailAndPassword(email: email, password: password),
          ).thenAnswer(
            (_) async => MockUserCredential(),
          );

          // Act
          await authRemoteDatasource.loginUser(email: email, password: password);

          // Assert
          verify(
            () => firebaseAuth.signInWithEmailAndPassword(email: email, password: password),
          ).called(1);

          verifyNoMoreInteractions(firebaseAuth);
        },
      );

      test(
        'should throw FirebaseServerException when signInWithEmailAndPassword fails',
        () async {
          // Arrange
          when(
            () => firebaseAuth.signInWithEmailAndPassword(email: email, password: password),
          ).thenThrow(
            tException,
          );

          // Act
          final methodCall = authRemoteDatasource.loginUser;

          // Assert
          expect(
            () async => methodCall(email: email, password: password),
            throwsA(isA<FirebaseServerException>()),
          );

          verify(
            () => firebaseAuth.signInWithEmailAndPassword(email: email, password: password),
          ).called(1);

          verifyNoMoreInteractions(firebaseAuth);
        },
      );
    },
  );

  group(
    'logoutUser',
    () {
      test(
        'should call signOut',
        () async {
          // Arrange
          when(
            () => firebaseAuth.signOut(),
          ).thenAnswer(
            (_) async => Future.value(),
          );

          // Act
          await authRemoteDatasource.logoutUser();

          // Assert
          verify(() => firebaseAuth.signOut()).called(1);

          verifyNoMoreInteractions(firebaseAuth);
        },
      );

      test(
        'should throw FirebaseServerException when signOut fails',
        () async {
          // Arrange
          when(
            () => firebaseAuth.signOut(),
          ).thenThrow(
            tException,
          );

          // Act
          final methodCall = authRemoteDatasource.logoutUser;

          // Assert
          expect(
            () async => methodCall(),
            throwsA(isA<FirebaseServerException>()),
          );

          verify(
            () => firebaseAuth.signOut(),
          ).called(1);

          verifyNoMoreInteractions(firebaseAuth);
        },
      );
    },
  );
}
