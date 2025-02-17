import 'package:app/core/utils/typedef.dart';

abstract class AuthRepository {
  const AuthRepository();

  ResultVoid createUser({required String email, required String password});

  ResultVoid loginUser({required String email, required String password});

  ResultVoid logoutUser();
}
