import 'package:flutter_clean_architech_tdd/core/usecase/usecase.dart';
import 'package:flutter_clean_architech_tdd/core/utils/typedef.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/domain/entities/user.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/domain/repositories/authentication_repository.dart';

class GetUsers extends UseCaseWithoutParams<List<User>> {
  const GetUsers(this._repository);

  final AuthenticationRepository _repository;

  //5
  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();
}
