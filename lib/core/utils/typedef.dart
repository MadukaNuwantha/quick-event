import 'package:app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;

typedef ResultStream<T> = Stream<Either<Failure, T>>;

typedef DataMap = Map<String, dynamic>;
