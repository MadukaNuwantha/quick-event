import 'package:equatable/equatable.dart';

class OrganizerEntity extends Equatable {
  const OrganizerEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  final int id;
  final String name;
  final String email;
  final String phoneNumber;

  const OrganizerEntity.empty()
      : this(
          id: 1,
          name: '_empty.string_',
          email: '_empty.string_',
          phoneNumber: '_empty.string_',
        );

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phoneNumber,
      ];
}
