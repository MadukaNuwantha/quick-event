/*

*  What does the class depend on
*   Answer - EventRemoteDatasource
*  How to create a fake version of the dependencies
*   Answer - Mocktail
*  How do we control what our dependencies do
*   Answer - using mocktail api

*/

import 'package:app/core/errors/exceptions.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/data/datasources/event_remote_datasource.dart';
import 'package:app/data/models/comment_model.dart';
import 'package:app/data/models/image_model.dart';
import 'package:app/data/models/organizer_model.dart';
import 'package:app/data/models/post_model.dart';
import 'package:app/data/repositories/event_repository_implementation.dart';
import 'package:app/domain/entities/comment_entity.dart';
import 'package:app/domain/entities/image_entity.dart';
import 'package:app/domain/entities/organizer_entity.dart';
import 'package:app/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEventRemoteDataSource extends Mock implements EventRemoteDatasource {}

void main() {
  late EventRemoteDatasource eventRemoteDatasource;
  late EventRepositoryImplementation eventRepositoryImplementation;

  setUp(() {
    eventRemoteDatasource = MockEventRemoteDataSource();
    eventRepositoryImplementation = EventRepositoryImplementation(eventRemoteDatasource);
  });

  const tException = ServerException(
    message: 'Unknown error occurred',
    statusCode: 500,
  );

  group(
    'getEventImages',
    () {
      test(
        'should return Right(List<ImageEntity>) when getting event images is successful',
        () async {
          when(() => eventRemoteDatasource.getEventImages()).thenAnswer(
            (_) async => [ImageModel.empty()],
          );

          final result = await eventRepositoryImplementation.getEventImages();

          expect(result, isA<Right<dynamic, List<ImageEntity>>>());

          verify(() => eventRemoteDatasource.getEventImages()).called(1);

          verifyNoMoreInteractions(eventRemoteDatasource);
        },
      );

      test(
        'should return Left(ServerFailure) when getting event images fails',
        () async {
          when(() => eventRemoteDatasource.getEventImages()).thenThrow(tException);

          final result = await eventRepositoryImplementation.getEventImages();

          expect(
            result,
            equals(
              Left(
                ServerFailure(
                  message: tException.message,
                  statusCode: tException.statusCode,
                ),
              ),
            ),
          );

          verify(() => eventRemoteDatasource.getEventImages()).called(1);

          verifyNoMoreInteractions(eventRemoteDatasource);
        },
      );
    },
  );

  group(
    'getEventOrganizers',
    () {
      test(
        'should return Right(List<OrganizerEntity>) when getting event organizers is successful',
        () async {
          when(() => eventRemoteDatasource.getEventOrganizers()).thenAnswer(
            (_) async => [OrganizerModel.empty()],
          );

          final result = await eventRepositoryImplementation.getEventOrganizers();

          expect(result, isA<Right<dynamic, List<OrganizerEntity>>>());

          verify(() => eventRemoteDatasource.getEventOrganizers()).called(1);

          verifyNoMoreInteractions(eventRemoteDatasource);
        },
      );

      test(
        'should return Left(ServerFailure) when getting event organizers fails',
        () async {
          when(() => eventRemoteDatasource.getEventOrganizers()).thenThrow(tException);

          final result = await eventRepositoryImplementation.getEventOrganizers();

          expect(
            result,
            equals(
              Left(
                ServerFailure(
                  message: tException.message,
                  statusCode: tException.statusCode,
                ),
              ),
            ),
          );

          verify(() => eventRemoteDatasource.getEventOrganizers()).called(1);

          verifyNoMoreInteractions(eventRemoteDatasource);
        },
      );
    },
  );

  group(
    'getEventComments',
    () {
      test(
        'should return Right(List<CommentEntity>) when getting event comments is successful',
        () async {
          when(() => eventRemoteDatasource.getEventComments()).thenAnswer(
            (_) async => [CommentModel.empty()],
          );

          final result = await eventRepositoryImplementation.getEventComments();

          expect(result, isA<Right<dynamic, List<CommentEntity>>>());

          verify(() => eventRemoteDatasource.getEventComments()).called(1);

          verifyNoMoreInteractions(eventRemoteDatasource);
        },
      );

      test(
        'should return Left(ServerFailure) when getting event comments fails',
        () async {
          when(() => eventRemoteDatasource.getEventComments()).thenThrow(tException);

          final result = await eventRepositoryImplementation.getEventComments();

          expect(
            result,
            equals(
              Left(
                ServerFailure(
                  message: tException.message,
                  statusCode: tException.statusCode,
                ),
              ),
            ),
          );

          verify(() => eventRemoteDatasource.getEventComments()).called(1);

          verifyNoMoreInteractions(eventRemoteDatasource);
        },
      );
    },
  );

  group(
    'getEventPosts',
    () {
      test(
        'should return Right(List<PostEntity>) when getting event posts is successful',
        () async {
          when(() => eventRemoteDatasource.getEventPosts()).thenAnswer(
            (_) async => [PostModel.empty()],
          );

          final result = await eventRepositoryImplementation.getEventPosts();

          expect(result, isA<Right<dynamic, List<PostEntity>>>());

          verify(() => eventRemoteDatasource.getEventPosts()).called(1);

          verifyNoMoreInteractions(eventRemoteDatasource);
        },
      );

      test(
        'should return Left(ServerFailure) when getting event posts fails',
        () async {
          when(() => eventRemoteDatasource.getEventPosts()).thenThrow(tException);

          final result = await eventRepositoryImplementation.getEventPosts();

          expect(
            result,
            equals(
              Left(
                ServerFailure(
                  message: tException.message,
                  statusCode: tException.statusCode,
                ),
              ),
            ),
          );

          verify(() => eventRemoteDatasource.getEventPosts()).called(1);

          verifyNoMoreInteractions(eventRemoteDatasource);
        },
      );
    },
  );
}
