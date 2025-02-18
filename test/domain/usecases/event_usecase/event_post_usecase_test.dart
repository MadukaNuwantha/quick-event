/*

*  What does the class depend on
*   Answer - EventRepository
*  How to create a fake version of the dependencies
*   Answer - Mocktail
*  How do we control what our dependencies do
*   Answer - using mocktail api

*/

import 'package:app/domain/entities/post_entity.dart';
import 'package:app/domain/repositories/event_repository.dart';
import 'package:app/domain/usecases/event_usecase/event_post_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'event_repository.mock.dart';

void main() {
  late EventPostUsecase eventPostUsecase;
  late EventRepository eventRepository;

  setUp(() {
    eventRepository = MockEventRepository();
    eventPostUsecase = EventPostUsecase(eventRepository);
  });

  final List<PostEntity> testPosts = [
    PostEntity.empty(),
    PostEntity.empty(),
    PostEntity.empty(),
    PostEntity.empty(),
  ];

  test(
    'should return a list of comments from the [EventRepository]',
    () async {
      //   Arrange
      when(() => eventRepository.getEventPosts()).thenAnswer(
        (_) async => Right(testPosts),
      );
      //   Act
      final result = await eventPostUsecase();
      //   Assert
      expect(
        result,
        equals(Right<dynamic, List<PostEntity>>(testPosts)),
      );
    },
  );
}
