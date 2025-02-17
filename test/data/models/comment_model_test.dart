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
import 'package:app/data/models/comment_model.dart';
import 'package:app/domain/entities/comment_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const tCommentModel = CommentModel.empty();
  final tJson = fixture('comment.json');
  final tMap = jsonDecode(tJson) as DataMap;

  test(
    'should be a subclass of [CommentEntity]',
    () {
      expect(tCommentModel, isA<CommentEntity>());
    },
  );

  group(
    'fromMap',
    () {
      test(
        'should return a [CommentModel] with the right data',
        () {
          final result = CommentModel.fromMap(tMap);
          expect(result, equals(tCommentModel));
        },
      );
    },
  );

  group(
    'fromJson',
    () {
      test(
        'should return a [CommentModel] with the right data',
        () {
          final result = CommentModel.fromJson(tJson);
          expect(result, equals(tCommentModel));
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
          final result = tCommentModel.toMap();
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
          final result = tCommentModel.toJson();
          final expectedJson = jsonEncode({
            "id": "_empty.string_",
            "userId": "_empty.string_",
            "title": "_empty.string_",
            "body": "_empty.string_"
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
        'should return a [CommentModel] with different data',
        () {
          final result = tCommentModel.copyWith(title: 'New Title');
          expect(result.title, equals('New Title'));
        },
      );
    },
  );
}
