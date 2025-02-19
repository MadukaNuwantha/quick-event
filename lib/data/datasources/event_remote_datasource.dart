import 'package:app/core/errors/exceptions.dart';
import 'package:app/core/network/nerwork_service.dart';
import 'package:app/data/models/comment_model.dart';
import 'package:app/data/models/image_model.dart';
import 'package:app/data/models/organizer_model.dart';
import 'package:app/data/models/post_model.dart';

abstract class EventRemoteDatasource {
  Future<List<ImageModel>> getEventImages();

  Future<List<OrganizerModel>> getEventOrganizers();

  Future<List<PostModel>> getEventPosts();

  Future<List<CommentModel>> getEventComments();
}

class EventRemoteDatasourceImpl implements EventRemoteDatasource {
  const EventRemoteDatasourceImpl(this._networkService);
  final NetworkService _networkService;

  @override
  Future<List<PostModel>> getEventPosts() async {
    try {
      final response = await _networkService.getRequest('posts');
      return (response.data as List)
          .map(
            (json) => PostModel.fromMap(json),
          )
          .toList();
    } catch (e) {
      throw ServerException(
        message: 'Error : $e',
        statusCode: 500,
      );
    }
  }

  @override
  Future<List<CommentModel>> getEventComments() async {
    try {
      final response = await _networkService.getRequest('comments');
      return (response.data as List)
          .map(
            (json) => CommentModel.fromMap(json),
          )
          .toList();
    } catch (e) {
      throw ServerException(
        message: 'Error : $e',
        statusCode: 500,
      );
    }
  }

  @override
  Future<List<ImageModel>> getEventImages() async {
    try {
      final response = await _networkService.getRequest('photos');
      return (response.data as List)
          .map(
            (json) => ImageModel.fromMap(json),
          )
          .take(10)
          .toList();
    } catch (e) {
      throw ServerException(
        message: 'Error : $e',
        statusCode: 500,
      );
    }
  }

  @override
  Future<List<OrganizerModel>> getEventOrganizers() async {
    try {
      final response = await _networkService.getRequest('users');
      return (response.data as List)
          .map(
            (json) => OrganizerModel.fromMap(json),
          )
          .toList();
    } catch (e) {
      throw ServerException(
        message: 'Error : $e',
        statusCode: 500,
      );
    }
  }
}
