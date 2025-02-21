import 'package:app/core/errors/failure.dart';
import 'package:app/domain/entities/comment_entity.dart';
import 'package:app/domain/entities/image_entity.dart';
import 'package:app/domain/entities/organizer_entity.dart';
import 'package:app/domain/entities/post_entity.dart';
import 'package:app/domain/usecases/event_usecase/event_comment_usecase.dart';
import 'package:app/domain/usecases/event_usecase/event_image_usecase.dart';
import 'package:app/domain/usecases/event_usecase/event_organizer_usecase.dart';
import 'package:app/domain/usecases/event_usecase/event_post_usecase.dart';
import 'package:app/presentation/bloc/event_bloc/event_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEventCommentUsecase extends Mock implements EventCommentUsecase {}

class MockEventImageUsecase extends Mock implements EventImageUsecase {}

class MockEventOrganizerUsecase extends Mock implements EventOrganizerUsecase {}

class MockEventPostUsecase extends Mock implements EventPostUsecase {}

void main() {
  late EventCommentUsecase eventCommentUsecase;
  late EventImageUsecase eventImageUsecase;
  late EventOrganizerUsecase eventOrganizerUsecase;
  late EventPostUsecase eventPostUsecase;
  late EventBloc eventBloc;

  setUp(
    () {
      eventCommentUsecase = MockEventCommentUsecase();
      eventImageUsecase = MockEventImageUsecase();
      eventOrganizerUsecase = MockEventOrganizerUsecase();
      eventPostUsecase = MockEventPostUsecase();

      eventBloc = EventBloc(
        eventCommentUsecase: eventCommentUsecase,
        eventImageUsecase: eventImageUsecase,
        eventOrganizerUsecase: eventOrganizerUsecase,
        eventPostUsecase: eventPostUsecase,
      );
    },
  );

  final tCommentData = [
    CommentEntity.empty(),
  ];
  final tPostData = [
    PostEntity.empty(),
  ];
  final tImageData = [
    ImageEntity.empty(),
  ];
  final tOrganizerData = [
    OrganizerEntity.empty(),
  ];

  final tFailure = ServerFailure(
    message: 'Server Failure',
    statusCode: 500,
  );

  tearDown(
    () {
      eventBloc.close();
    },
  );

  group(
    'EventBloc Tests',
    () {
      test(
        'initial state is EventInitial',
        () async {
          expect(eventBloc.state, EventInitial());
        },
      );

      blocTest<EventBloc, EventState>(
        'emits [EventLoading, EventLoaded] when LoadEventComments is successful',
        build: () {
          when(
            () => eventCommentUsecase(),
          ).thenAnswer(
            (_) async => Right(tCommentData),
          );
          return eventBloc;
        },
        act: (bloc) => bloc.add(
          LoadEventComments(),
        ),
        expect: () => [
          EventLoading(),
          EventLoaded(tCommentData),
        ],
      );

      blocTest<EventBloc, EventState>(
        'emits [EventLoading, EventError] when LoadEventComments fails',
        build: () {
          when(
            () => eventCommentUsecase(),
          ).thenAnswer(
            (_) async => Left(tFailure),
          );
          return eventBloc;
        },
        act: (bloc) => bloc.add(
          LoadEventComments(),
        ),
        expect: () => [
          EventLoading(),
          EventError(tFailure.message),
        ],
      );

      blocTest<EventBloc, EventState>(
        'emits [EventLoading, EventLoaded] when LoadEventImages is successful',
        build: () {
          when(
            () => eventImageUsecase(),
          ).thenAnswer(
            (_) async => Right(tImageData),
          );
          return eventBloc;
        },
        act: (bloc) => bloc.add(
          LoadEventImages(),
        ),
        expect: () => [
          EventLoading(),
          EventLoaded(tImageData),
        ],
      );

      blocTest<EventBloc, EventState>(
        'emits [EventLoading, EventError] when LoadEventImages fails',
        build: () {
          when(
            () => eventImageUsecase(),
          ).thenAnswer(
            (_) async => Left(tFailure),
          );
          return eventBloc;
        },
        act: (bloc) => bloc.add(
          LoadEventImages(),
        ),
        expect: () => [
          EventLoading(),
          EventError(tFailure.message),
        ],
      );

      blocTest<EventBloc, EventState>(
        'emits [EventLoading, EventLoaded] when LoadEventOrganizers is successful',
        build: () {
          when(
            () => eventOrganizerUsecase(),
          ).thenAnswer(
            (_) async => Right(tOrganizerData),
          );
          return eventBloc;
        },
        act: (bloc) => bloc.add(
          LoadEventOrganizers(),
        ),
        expect: () => [
          EventLoading(),
          EventLoaded(tOrganizerData),
        ],
      );

      blocTest<EventBloc, EventState>(
        'emits [EventLoading, EventError] when LoadEventOrganizers fails',
        build: () {
          when(
            () => eventOrganizerUsecase(),
          ).thenAnswer(
            (_) async => Left(tFailure),
          );
          return eventBloc;
        },
        act: (bloc) => bloc.add(
          LoadEventOrganizers(),
        ),
        expect: () => [
          EventLoading(),
          EventError(tFailure.message),
        ],
      );

      blocTest<EventBloc, EventState>(
        'emits [EventLoading, EventLoaded] when LoadEventPosts is successful',
        build: () {
          when(
            () => eventPostUsecase(),
          ).thenAnswer(
            (_) async => Right(tPostData),
          );
          return eventBloc;
        },
        act: (bloc) => bloc.add(
          LoadEventPosts(),
        ),
        expect: () => [
          EventLoading(),
          EventLoaded(tPostData),
        ],
      );

      blocTest<EventBloc, EventState>(
        'emits [EventLoading, EventError] when LoadEventPosts fails',
        build: () {
          when(
            () => eventPostUsecase(),
          ).thenAnswer(
            (_) async => Left(tFailure),
          );
          return eventBloc;
        },
        act: (bloc) => bloc.add(
          LoadEventPosts(),
        ),
        expect: () => [
          EventLoading(),
          EventError(tFailure.message),
        ],
      );
    },
  );
}
