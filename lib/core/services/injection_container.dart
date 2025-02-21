import 'package:app/core/network/nerwork_service.dart';
import 'package:app/data/datasources/auth_remote_datasource.dart';
import 'package:app/data/datasources/event_remote_datasource.dart';
import 'package:app/data/datasources/user_remote_datasource.dart';
import 'package:app/data/repositories/auth_repository_implementation.dart';
import 'package:app/data/repositories/event_repository_implementation.dart';
import 'package:app/data/repositories/user_repository_implementation.dart';
import 'package:app/domain/repositories/auth_repository.dart';
import 'package:app/domain/repositories/event_repository.dart';
import 'package:app/domain/repositories/user_repository.dart';
import 'package:app/domain/usecases/auth_usecases/auth_login_usecase.dart';
import 'package:app/domain/usecases/auth_usecases/auth_logout_usecase.dart';
import 'package:app/domain/usecases/event_usecase/event_comment_usecase.dart';
import 'package:app/domain/usecases/event_usecase/event_image_usecase.dart';
import 'package:app/domain/usecases/event_usecase/event_organizer_usecase.dart';
import 'package:app/domain/usecases/event_usecase/event_post_usecase.dart';
import 'package:app/domain/usecases/user_usecases/user_create_usecase.dart';
import 'package:app/domain/usecases/user_usecases/user_get_usecase.dart';
import 'package:app/domain/usecases/user_usecases/user_save_usecase.dart';
import 'package:app/domain/usecases/user_usecases/user_update_usecase.dart';
import 'package:app/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:app/presentation/bloc/event_bloc/event_bloc.dart';
import 'package:app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    // Application Logic
    ..registerLazySingleton(
      () => AuthBloc(
        authLoginUsecase: sl(),
        authLogoutUsecase: sl(),
      ),
    )
    ..registerLazySingleton(
      () => UserBloc(
        userCreateUsecase: sl(),
        userGetUsecase: sl(),
        userSaveUsecase: sl(),
        userUpdateUsecase: sl(),
      ),
    )
    ..registerLazySingleton(
      () => EventBloc(
        eventCommentUsecase: sl(),
        eventImageUsecase: sl(),
        eventOrganizerUsecase: sl(),
        eventPostUsecase: sl(),
      ),
    )

    // Usecases
    ..registerLazySingleton(() => AuthLoginUsecase(sl()))
    ..registerLazySingleton(() => AuthLogoutUsecase(sl()))
    ..registerLazySingleton(() => UserCreateUsecase(sl()))
    ..registerLazySingleton(() => UserGetUsecase(sl()))
    ..registerLazySingleton(() => UserSaveUsecase(sl()))
    ..registerLazySingleton(() => UserUpdateUsecase(sl()))
    ..registerLazySingleton(() => EventCommentUsecase(sl()))
    ..registerLazySingleton(() => EventImageUsecase(sl()))
    ..registerLazySingleton(() => EventOrganizerUsecase(sl()))
    ..registerLazySingleton(() => EventPostUsecase(sl()))

    // Repositories
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImplementation(sl()))
    ..registerLazySingleton<UserRepository>(() => UserRepositoryImplementation(sl()))
    ..registerLazySingleton<EventRepository>(() => EventRepositoryImplementation(sl()))

    // Data Sources
    ..registerLazySingleton<AuthRemoteDatasource>(() => AuthRemoteDatasourceImpl(sl()))
    ..registerLazySingleton<UserRemoteDatasource>(() => UserRemoteDatasourceImpl(sl(), sl()))
    ..registerLazySingleton<EventRemoteDatasource>(() => EventRemoteDatasourceImpl(sl()))

    // External Dependencies
    ..registerLazySingleton(NetworkService.new)
    ..registerLazySingleton(() => FirebaseAuth.instance)
    ..registerLazySingleton(() => FirebaseFirestore.instance);
}
