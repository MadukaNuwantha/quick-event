/*

*  What does the class depend on
*   Answer - No dependencies
*  How to create a fake version of the dependencies
*   Answer - Mocktail
*  How do we control what our dependencies do
*   Answer - using mocktail api

*/

import 'dart:convert';

import 'package:app/core/utils/typedef.dart';
import 'package:app/data/models/organizer_model.dart';
import 'package:app/domain/entities/organizer_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const tOrganizerModel = OrganizerModel.empty();
  final tJson = fixture('organizer.json');
  final tMap = jsonDecode(tJson) as DataMap;

  test(
    'should be a subclass of [OrganizerEntity]',
    () {
      expect(tOrganizerModel, isA<OrganizerEntity>());
    },
  );

  group(
    'fromMap',
    () {
      test(
        'should return an [OrganizerModel] with the right data',
        () {
          final result = OrganizerModel.fromMap(tMap);
          expect(result, equals(tOrganizerModel));
        },
      );
    },
  );

  group(
    'fromJson',
    () {
      test(
        'should return an [OrganizerModel] with the right data',
        () {
          final result = OrganizerModel.fromJson(tJson);
          expect(result, equals(tOrganizerModel));
        },
      );
    },
  );

  group(
    'toMap',
    () {
      test(
        'should return a [Map] with the right data',
        () {
          final result = tOrganizerModel.toMap();
          expect(result, equals(tMap));
        },
      );
    },
  );

  group(
    'toJson',
    () {
      test(
        'should return a [Json] with the right data',
        () {
          final result = tOrganizerModel.toJson();
          final tJson = jsonEncode({
            "id": "_empty.string_",
            "name": "_empty.string_",
            "email": "_empty.string_",
            "phoneNumber": "_empty.string_"
          });
          expect(result, equals(tJson));
        },
      );
    },
  );

  group(
    'copyWith',
    () {
      test(
        'should return an [OrganizerModel] with different data',
        () {
          final result = tOrganizerModel.copyWith(name: 'New Organizer');
          expect(result.name, equals('New Organizer'));
        },
      );
    },
  );
}
