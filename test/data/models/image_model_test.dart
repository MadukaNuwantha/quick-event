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
import 'package:app/data/models/image_model.dart';
import 'package:app/domain/entities/image_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const tImageModel = ImageModel.empty();
  final tJson = fixture('image.json');
  final tMap = jsonDecode(tJson) as DataMap;

  test(
    'should be a subclass of [ImageEntity]',
    () {
      expect(tImageModel, isA<ImageEntity>());
    },
  );

  group(
    'fromMap',
    () {
      test(
        'should return an [ImageModel] with the right data',
        () {
          final result = ImageModel.fromMap(tMap);
          expect(result, equals(tImageModel));
        },
      );
    },
  );

  group(
    'fromJson',
    () {
      test(
        'should return an [ImageModel] with the right data',
        () {
          final result = ImageModel.fromJson(tJson);
          expect(result, equals(tImageModel));
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
          final result = tImageModel.toMap();
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
          final result = tImageModel.toJson();
          final tJson = jsonEncode({
            "id": "_empty.string_",
            "albumId": "_empty.string_",
            "title": "_empty.string_",
            "url": "_empty.string_",
            "thumbnailUrl": "_empty.string_"
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
        'should return an [ImageModel] with different data',
        () {
          final result = tImageModel.copyWith(title: 'New Title');
          expect(result.title, equals('New Title'));
        },
      );
    },
  );
}
