import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.address,
  });

  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String address;

  const UserEntity.empty()
      : this(
          id: '_empty.string_',
          email: '_empty.string_',
          firstName: '_empty.string_',
          lastName: '_empty.string_',
          phoneNumber: '_empty.string_',
          address: '_empty.string_',
        );

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        phoneNumber,
        address,
      ];
}
