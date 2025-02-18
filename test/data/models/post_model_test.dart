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
import 'package:app/data/models/post_model.dart';
import 'package:app/domain/entities/post_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const tPostModel = PostModel.empty();
  final tJson = fixture('post.json');
  final tMap = jsonDecode(tJson) as DataMap;

  test(
    'should be a subclass of [PostEntity]',
    () {
      expect(tPostModel, isA<PostEntity>());
    },
  );

  group(
    'fromMap',
    () {
      test(
        'should return a [PostModel] with the right data',
        () {
          final result = PostModel.fromMap(tMap);
          expect(result, equals(tPostModel));
        },
      );
    },
  );

  group(
    'fromJson',
    () {
      test(
        'should return a [PostModel] with the right data',
        () {
          final result = PostModel.fromJson(tJson);
          expect(result, equals(tPostModel));
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
          final result = tPostModel.toMap();
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
          final result = tPostModel.toJson();
          final expectedJson = jsonEncode({
            "id": 1,
            "userId": 1,
            "title": "_empty.string_",
            "body": "_empty.string_",
          });
          expect(result, equals(expectedJson));
        },
      );
    },
  );

  group(
    'copyWith',
    () {
      test(
        'should return a [PostModel] with different data',
        () {
          final result = tPostModel.copyWith(title: 'New Title');
          expect(result.title, equals('New Title'));
        },
      );
    },
  );
}
