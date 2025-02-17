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
import 'package:app/data/models/user_model.dart';
import 'package:app/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const tUserModel = UserModel.empty();
  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  test(
    'should be a sub class of [UserEntity]',
    () {
      expect(tUserModel, isA<UserEntity>());
    },
  );

  group(
    'fromMap',
    () {
      test(
        'should return a [UserModel] with the right data',
        () {
          final result = UserModel.fromMap(tMap);
          expect(result, equals(tUserModel));
        },
      );
    },
  );

  group(
    'fromJson',
    () {
      test(
        'should return a [UserModel] with the right data',
        () {
          final result = UserModel.fromJson(tJson);
          expect(result, equals(tUserModel));
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
          final result = tUserModel.toMap();
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
          final result = tUserModel.toJson();
          final tJson = jsonEncode({
            "id": "_empty.string_",
            "email": "_empty.string_",
            "firstName": "_empty.string_",
            "lastName": "_empty.string_",
            "phoneNumber": "_empty.string_",
            "address": "_empty.string_"
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
        'should return a [UserModel] with different data',
        () {
          final result = tUserModel.copyWith(firstName: 'FirstName');
          expect(result.firstName, equals('FirstName'));
        },
      );
    },
  );
}
