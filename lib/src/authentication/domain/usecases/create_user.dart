import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architech_tdd/core/usecase/usecase.dart';
import 'package:flutter_clean_architech_tdd/core/utils/typedef.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/domain/repositories/authentication_repository.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams> {
  const CreateUser(this._repository);
  final AuthenticationRepository _repository;

  @override
  ResultFuture call(CreateUserParams params) async => _repository.createUser(
      createdAt: params.createdAt, name: params.name, avatar: params.avatar); //createdAt: 'testFail'
}

class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  //For TDD
  const CreateUserParams.empty(): this(createdAt: '_empty.createdAt',name: '_empty.name',avatar: '_empty.avatar');

  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [createdAt, name, avatar];
}
