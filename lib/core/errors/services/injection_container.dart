import 'package:flutter_clean_architech_tdd/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/data/repository/authentication_repository_implementation.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/domain/usecases/create_user.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/domain/usecases/get_users.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl
    //App Logic
    ..registerFactory(
      () => AuthenticationCubit(createUser: sl(), getUsers: sl()),
    )

    //Use Case
    ..registerLazySingleton(
      () => CreateUser(sl()),
    )
    ..registerLazySingleton(
      () => GetUsers(sl()),
    )

    //Repository
    ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImplementation(sl()))

    //Data Source
    ..registerLazySingleton<AuthenticationRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(sl()))

    //External Dependencies
    ..registerLazySingleton(http.Client.new);
}
