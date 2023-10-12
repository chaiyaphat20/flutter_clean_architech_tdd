import 'package:flutter_clean_architech_tdd/core/utils/typedef.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/domain/entities/user.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthenticationRepository{
  @override
  ResultVoid createUser({required String createdAt, required String name, required String avatar}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

}