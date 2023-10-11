import 'package:flutter_clean_architech_tdd/core/usecase/usecase.dart';
import 'package:flutter_clean_architech_tdd/core/utils/typedef.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/domain/entities/user.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/domain/repositories/authentication_repository.dart';

class GetUser extends UsecaseWithoutParams<List<User>>{
  const GetUser(this._repository);
  final AuthenticationRepository _repository;

  @override
  ResultFuture<List<User>> call()  async => _repository.getUsers(); 
}