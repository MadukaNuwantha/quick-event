/*

*  What does the class depend on
*   Answer - EventRepository
*  How to create a fake version of the dependencies
*   Answer - Mocktail
*  How do we control what our dependencies do
*   Answer - using mocktail api

*/

import 'package:app/domain/entities/comment_entity.dart';
import 'package:app/domain/repositories/event_repository.dart';
import 'package:app/domain/usecases/event_usecase/event_comment_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'event_repository.mock.dart';

void main() {
  late EventCommentUsecase eventCommentUsecase;
  late EventRepository eventRepository;

  setUp(() {
    eventRepository = MockEventRepository();
    eventCommentUsecase = EventCommentUsecase(eventRepository);
  });

  final List<CommentEntity> testComments = [
    CommentEntity.empty(),
    CommentEntity.empty(),
    CommentEntity.empty(),
    CommentEntity.empty(),
  ];

  test(
    'should return a list of comments from the [EventRepository]',
    () async {
      //   Arrange
      when(() => eventRepository.getEventComments()).thenAnswer(
        (_) async => Right(testComments),
      );
      //   Act
      final result = await eventCommentUsecase();
      //   Assert
      expect(
        result,
        equals(Right<dynamic, List<CommentEntity>>(testComments)),
      );
    },
  );
}
