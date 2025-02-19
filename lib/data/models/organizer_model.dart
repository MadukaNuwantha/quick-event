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
          id: 1,
          name: '_empty.string_',
          email: '_empty.string_',
          phoneNumber: '_empty.string_',
        );

  OrganizerModel.fromMap(DataMap map)
      : this(
          id: map['id'] as int,
          name: map['name'] as String,
          email: map['email'] as String,
          phoneNumber: map['phone'] as String,
        );

  factory OrganizerModel.fromJson(String source) => OrganizerModel.fromMap(jsonDecode(source) as DataMap);

  OrganizerModel copyWith({
    int? id,
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
