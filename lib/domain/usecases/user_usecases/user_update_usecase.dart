import 'package:app/core/usecase/usecase.dart';
import 'package:app/core/utils/typedef.dart';
import 'package:app/domain/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

class UserUpdateUsecase extends UsecaseWithParams<void, UserUpdateParams> {
  const UserUpdateUsecase(this._userRepository);

  final UserRepository _userRepository;

  @override
  ResultVoid call(UserUpdateParams params) async => _userRepository.updateUser(
        firstName: params.firstName,
        lastName: params.lastName,
        email: params.email,
        phoneNumber: params.phoneNumber,
        address: params.address,
      );
}

class UserUpdateParams extends Equatable {
  const UserUpdateParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });

  const UserUpdateParams.empty()
      : this(
          firstName: '_empty.string',
          lastName: '_empty.string',
          email: '_empty.string',
          phoneNumber: '_empty.string',
          address: '_empty.string',
        );
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String address;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        phoneNumber,
        address,
      ];
}
