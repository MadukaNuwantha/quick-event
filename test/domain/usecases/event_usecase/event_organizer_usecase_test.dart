/*

*  What does the class depend on
*   Answer - EventRepository
*  How to create a fake version of the dependencies
*   Answer - Mocktail
*  How do we control what our dependencies do
*   Answer - using mocktail api

*/

import 'package:app/domain/entities/organizer_entity.dart';
import 'package:app/domain/repositories/event_repository.dart';
import 'package:app/domain/usecases/event_usecase/event_organizer_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'event_repository.mock.dart';

void main() {
  late EventOrganizerUsecase eventOrganizerUsecase;
  late EventRepository eventRepository;

  setUp(() {
    eventRepository = MockEventRepository();
    eventOrganizerUsecase = EventOrganizerUsecase(eventRepository);
  });

  final List<OrganizerEntity> testOrganizers = [
    OrganizerEntity.empty(),
    OrganizerEntity.empty(),
    OrganizerEntity.empty(),
    OrganizerEntity.empty(),
  ];

  test(
    'should return a list of comments from the [EventRepository]',
    () async {
      //   Arrange
      when(() => eventRepository.getEventOrganizers()).thenAnswer(
        (_) async => Right(testOrganizers),
      );
      //   Act
      final result = await eventOrganizerUsecase();
      //   Assert
      expect(
        result,
        equals(Right<dynamic, List<OrganizerEntity>>(testOrganizers)),
      );
    },
  );
}
