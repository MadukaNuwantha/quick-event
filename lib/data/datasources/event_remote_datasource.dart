import 'package:app/data/models/comment_model.dart';
import 'package:app/data/models/image_model.dart';
import 'package:app/data/models/organizer_model.dart';

abstract class EventRemoteDatasource {
  Future<List<ImageModel>> getEventImages();

  Future<List<OrganizerModel>> getEventOrganizers();

  Future<List<CommentModel>> getEventComments();
}

class EventRemoteDatasourceImpl implements EventRemoteDatasource {
  @override
  Future<List<CommentModel>> getEventComments() {
    throw UnimplementedError();
  }

  @override
  Future<List<ImageModel>> getEventImages() {
    throw UnimplementedError();
  }

  @override
  Future<List<OrganizerModel>> getEventOrganizers() {
    throw UnimplementedError();
  }
}
