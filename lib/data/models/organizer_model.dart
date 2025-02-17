import 'dart:convert';

import 'package:app/core/utils/typedef.dart';
import 'package:app/domain/entities/organizer_entity.dart';

class OrganizerModel extends OrganizerEntity {
  const OrganizerModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phoneNumber,
  });

  const OrganizerModel.empty()
      : this(
          id: '_empty.string_',
          name: '_empty.string_',
          email: '_empty.string_',
          phoneNumber: '_empty.string_',
        );

  OrganizerModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          name: map['name'] as String,
          email: map['email'] as String,
          phoneNumber: map['phoneNumber'] as String,
        );

  factory OrganizerModel.fromJson(String source) => OrganizerModel.fromMap(jsonDecode(source) as DataMap);

  OrganizerModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
  }) {
    return OrganizerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  DataMap toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
      };

  String toJson() => jsonEncode(toMap());
}
