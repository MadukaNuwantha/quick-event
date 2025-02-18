import 'package:app/core/errors/exceptions.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/typedef.dart';
import 'package:app/data/datasources/event_remote_datasource.dart';
import 'package:app/domain/entities/comment_entity.dart';
import 'package:app/domain/entities/image_entity.dart';
import 'package:app/domain/entities/organizer_entity.dart';
import 'package:app/domain/repositories/event_repository.dart';
import 'package:dartz/dartz.dart';

class EventRepositoryImplementation implements EventRepository {
  const EventRepositoryImplementation(this._eventRemoteDatasource);

  final EventRemoteDatasource _eventRemoteDatasource;

  @override
  ResultFuture<List<ImageEntity>> getEventImages() async {
    try {
      final result = await _eventRemoteDatasource.getEventImages();
      return Right([ImageEntity.empty()]);
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
      return Right([OrganizerEntity.empty()]);
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
      return Right([CommentEntity.empty()]);
    } on ServerException catch (e) {
      return Left(
        ServerFailure.fromException(e),
      );
    }
  }
}
