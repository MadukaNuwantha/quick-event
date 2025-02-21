import 'package:app/core/errors/exceptions.dart';
import 'package:app/core/network/nerwork_service.dart';
import 'package:app/data/datasources/event_remote_datasource.dart';
import 'package:app/data/models/comment_model.dart';
import 'package:app/data/models/image_model.dart';
import 'package:app/data/models/organizer_model.dart';
import 'package:app/data/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNetworkService extends Mock implements NetworkService {}

void main() {
  late NetworkService networkService;
  late EventRemoteDatasource eventRemoteDatasource;

  setUp(
    () {
      networkService = MockNetworkService();
      eventRemoteDatasource = EventRemoteDatasourceImpl(networkService);
    },
  );

  final postResponse = {
    'id': 1,
    'userId': 1,
    'title': '_empty.string',
    'body': '_empty.string',
  };

  final commentResponse = {
    'postId': 1,
    'id': 1,
    'name': '_empty.string',
    'email': '_empty.string',
    'body': '_empty.string',
  };

  final imageResponse = {
    'albumId': 1,
    'id': 1,
    'title': '_empty.string',
    'url': '_empty.string',
    'thumbnailUrl': '_empty.string',
  };

  final organizerResponse = {
    'id': 1,
    'name': '_empty.string',
    'username': '_empty.string',
    'email': '_empty.string',
    'address': {
      'street': '_empty.string',
      'suite': '_empty.string',
      'city': '_empty.string',
      'zipcode': '_empty.string',
      'geo': {
        'lat': '_empty.string',
        'lng': '_empty.string',
      }
    },
    'phone': '_empty.string',
    'website': '_empty.string',
    'company': {
      'name': '_empty.string',
      'catchPhrase': '_empty.string',
      'bs': '_empty.string',
    }
  };

  group(
    'getEventPosts',
    () {
      test(
        'should return a list of [PostModel] when getEventPosts is successful',
        () async {
          when(() => networkService.getRequest('posts')).thenAnswer(
            (_) async => Response(
              data: List.generate(
                10,
                (index) => postResponse,
              ),
              statusCode: 200,
              requestOptions: RequestOptions(path: 'posts'),
            ),
          );

          final result = await eventRemoteDatasource.getEventPosts();

          expect(result, isA<List<PostModel>>());

          expect(result.length, 10);

          verify(
            () => networkService.getRequest('posts'),
          ).called(1);

          verifyNoMoreInteractions(networkService);
        },
      );

      test(
        'should throw [ServerException] when the status code is not 200 or 201',
        () {
          when(() => networkService.getRequest(any())).thenAnswer(
            (_) async => Response(
              data: '_empty.string_',
              statusCode: 400,
              requestOptions: RequestOptions(path: 'posts'),
            ),
          );

          final methodCall = eventRemoteDatasource.getEventPosts;

          expect(
            () async => methodCall(),
            throwsA(isA<ServerException>()),
          );

          verify(
            () => networkService.getRequest(any()),
          ).called(1);

          verifyNoMoreInteractions(networkService);
        },
      );
    },
  );

  group(
    'getEventComments',
    () {
      test(
        'should return a list of [CommentModel] when getEventComments is successful',
        () async {
          when(() => networkService.getRequest('comments')).thenAnswer(
            (_) async => Response(
              data: List.generate(
                10,
                (index) => commentResponse,
              ),
              statusCode: 200,
              requestOptions: RequestOptions(path: 'comments'),
            ),
          );

          final result = await eventRemoteDatasource.getEventComments();

          expect(result, isA<List<CommentModel>>());

          expect(result.length, 10);

          verify(
            () => networkService.getRequest('comments'),
          ).called(1);

          verifyNoMoreInteractions(networkService);
        },
      );
      test(
        'should throw [ServerException] when the status code is not 200 or 201',
        () {
          when(() => networkService.getRequest('comments')).thenAnswer(
            (_) async => Response(
              data: '_empty.string_',
              statusCode: 400,
              requestOptions: RequestOptions(path: 'comments'),
            ),
          );

          final methodCall = eventRemoteDatasource.getEventComments;

          expect(
            () async => methodCall(),
            throwsA(isA<ServerException>()),
          );

          verify(
            () => networkService.getRequest('comments'),
          ).called(1);

          verifyNoMoreInteractions(networkService);
        },
      );
    },
  );

  group(
    'getEventImages',
    () {
      test(
        'should return a list of [ImageModel] when getEventImages is successful',
        () async {
          when(() => networkService.getRequest('photos')).thenAnswer(
            (_) async => Response(
              data: List.generate(
                10,
                (index) => imageResponse,
              ),
              statusCode: 200,
              requestOptions: RequestOptions(path: 'photos'),
            ),
          );

          final result = await eventRemoteDatasource.getEventImages();

          expect(result, isA<List<ImageModel>>());

          expect(result.length, 10);

          verify(
            () => networkService.getRequest('photos'),
          ).called(1);

          verifyNoMoreInteractions(networkService);
        },
      );

      test(
        'should throw [ServerException] when the status code is not 200 or 201',
        () {
          when(() => networkService.getRequest('photos')).thenAnswer(
            (_) async => Response(
              data: '_empty.string_',
              statusCode: 400,
              requestOptions: RequestOptions(path: 'photos'),
            ),
          );

          final methodCall = eventRemoteDatasource.getEventImages;

          expect(
            () async => methodCall(),
            throwsA(isA<ServerException>()),
          );

          verify(
            () => networkService.getRequest('photos'),
          ).called(1);

          verifyNoMoreInteractions(networkService);
        },
      );
    },
  );

  group(
    'getEventOrganizers',
    () {
      test(
        'should return a list of [OrganizerModel] when getEventOrganizers is successful',
        () async {
          when(() => networkService.getRequest('users')).thenAnswer(
            (_) async => Response(
              data: List.generate(
                10,
                (index) => organizerResponse,
              ),
              statusCode: 200,
              requestOptions: RequestOptions(path: 'users'),
            ),
          );

          final result = await eventRemoteDatasource.getEventOrganizers();

          expect(result, isA<List<OrganizerModel>>());

          expect(result.length, 10);

          verify(
            () => networkService.getRequest('users'),
          ).called(1);

          verifyNoMoreInteractions(networkService);
        },
      );

      test(
        'should throw [ServerException] when the status code is not 200 or 201',
        () {
          when(() => networkService.getRequest('users')).thenAnswer(
            (_) async => Response(
              data: '_empty.string_',
              statusCode: 400,
              requestOptions: RequestOptions(path: 'users'),
            ),
          );

          final methodCall = eventRemoteDatasource.getEventOrganizers;

          expect(
            () async => methodCall(),
            throwsA(isA<ServerException>()),
          );

          verify(
            () => networkService.getRequest('users'),
          ).called(1);

          verifyNoMoreInteractions(networkService);
        },
      );
    },
  );
}
