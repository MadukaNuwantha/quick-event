import 'package:app/core/errors/exceptions.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/typedef.dart';
import 'package:app/data/datasources/event_remote_datasource.dart';
import 'package:app/domain/entities/comment_entity.dart';
import 'package:app/domain/entities/image_entity.dart';
import 'package:app/domain/entities/organizer_entity.dart';
import 'package:app/domain/entities/post_entity.dart';
import 'package:app/domain/repositories/event_repository.dart';
import 'package:dartz/dartz.dart';

class EventRepositoryImplementation implements EventRepository {
  const EventRepositoryImplementation(this._eventRemoteDatasource);

  final EventRemoteDatasource _eventRemoteDatasource;

  @override
  ResultFuture<List<ImageEntity>> getEventImages() async {
    try {
      final result = await _eventRemoteDatasource.getEventImages();
      final imageEntities = result
          .map((imageModel) => ImageEntity(
                id: imageModel.id,
                albumId: imageModel.albumId,
                title: imageModel.title,
                url: imageModel.url,
                thumbnailUrl: imageModel.thumbnailUrl,
              ))
          .toList();
      return Right(imageEntities);
    } on ServerException catch (e) {
      return Left(
        ServerFailure.fromException(e),
      );
    }
  }

  @override
  ResultFuture<List<OrganizerEntity>> getEventOrganizers() async {
    try {
      final result = await _eventRemoteDatasource.getEventOrganizers();
      final organizerEntities = result
          .map((organizerModel) => OrganizerEntity(
                id: organizerModel.id,
                name: organizerModel.name,
                email: organizerModel.email,
                phoneNumber: organizerModel.phoneNumber,
              ))
          .toList();
      return Right(organizerEntities);
    } on ServerException catch (e) {
      return Left(
        ServerFailure.fromException(e),
      );
    }
  }

  @override
  ResultFuture<List<CommentEntity>> getEventComments() async {
    try {
      final result = await _eventRemoteDatasource.getEventComments();
      final commentEntities = result
          .map((commentModel) => CommentEntity(
                id: commentModel.id,
                postId: commentModel.postId,
                name: commentModel.name,
                email: commentModel.email,
                body: commentModel.body,
              ))
          .toList();
      return Right(commentEntities);
    } on ServerException catch (e) {
      return Left(
        ServerFailure.fromException(e),
      );
    }
  }

  @override
  ResultFuture<List<PostEntity>> getEventPosts() async {
    try {
      final result = await _eventRemoteDatasource.getEventPosts();
      final postEntities = result
          .map((postModel) => PostEntity(
                id: postModel.id,
                userId: postModel.userId,
                title: postModel.title,
                body: postModel.body,
              ))
          .toList();
      return Right(postEntities);
    } on ServerException catch (e) {
      return Left(
        ServerFailure.fromException(e),
      );
    }
  }
}
