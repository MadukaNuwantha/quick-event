/*

*  What does the class depend on
*   Answer - EventRepository
*  How to create a fake version of the dependencies
*   Answer - Mocktail
*  How do we control what our dependencies do
*   Answer - using mocktail api

*/

import 'package:app/domain/entities/image_entity.dart';
import 'package:app/domain/repositories/event_repository.dart';
import 'package:app/domain/usecases/event_usecase/event_image_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'event_repository.mock.dart';

void main() {
  late EventImageUsecase eventImageUsecase;
  late EventRepository eventRepository;

  setUp(() {
    eventRepository = MockEventRepository();
    eventImageUsecase = EventImageUsecase(eventRepository);
  });

  final List<ImageEntity> testImages = [
    ImageEntity.empty(),
    ImageEntity.empty(),
    ImageEntity.empty(),
    ImageEntity.empty(),
  ];

  test(
    'should return a list of comments from the [EventRepository]',
    () async {
      //   Arrange
      when(() => eventRepository.getEventImages()).thenAnswer(
        (_) async => Right(testImages),
      );
      //   Act
      final result = await eventImageUsecase();
      //   Assert
      expect(
        result,
        equals(Right<dynamic, List<ImageEntity>>(testImages)),
      );
    },
  );
}
