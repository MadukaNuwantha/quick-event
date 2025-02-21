import 'dart:convert';

import 'package:app/core/utils/typedef.dart';
import 'package:app/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.phoneNumber,
    required super.address,
  });

  const UserModel.empty()
      : this(
          id: '_empty.string_',
          email: '_empty.string_',
          firstName: '_empty.string_',
          lastName: '_empty.string_',
          phoneNumber: '_empty.string_',
          address: '_empty.string_',
        );

  UserModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          email: map['email'] as String,
          firstName: map['firstName'] as String,
          lastName: map['lastName'] as String,
          phoneNumber: map['phoneNumber'] as String,
          address: map['address'] as String,
        );

  factory UserModel.fromJson(String source) => UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? address,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
    );
  }

  DataMap toMap() => {
        'id': id,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'address': address,
      };

  String toJson() => jsonEncode(toMap());
}
