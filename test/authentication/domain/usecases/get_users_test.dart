import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/domain/entities/user.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/domain/usecases/get_users.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'create_user_test.dart';

void main(){
  late AuthenticationRepository repository;
  late GetUser usecase;

  setUp((){
    repository = MockAuthRepo();
    usecase = GetUser(repository);
  });

  const tResponse = [User.empty()];

  test('should call the [AuthRepo.getUser] and return [List<User>]',  ()async {
    //Arrange
    when(() => repository.getUsers()).thenAnswer((_) async=> Right(tResponse));

    //Act 
    final result = await usecase();
    final user = result.getOrElse(() => tResponse); // ดึงค่า User จาก Right
    print(user[0].name); //_empty.name
    print(user[0].avatar); //_empty.avatar
    print(user[0].id);//1
    print(user[0].createdAt);//_empty.createdAt

    //Expect
    expect(result, equals(const Right<dynamic,List<User>>(tResponse)));
    verify(() => repository.getUsers()).called(1);
    verifyNoMoreInteractions(repository);
  });

}