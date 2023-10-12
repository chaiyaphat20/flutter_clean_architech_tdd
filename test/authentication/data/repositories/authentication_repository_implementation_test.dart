import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architech_tdd/core/errors/exception.dart';
import 'package:flutter_clean_architech_tdd/core/errors/failure.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/data/repository/authentication_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSrc extends Mock
    implements AuthenticationRemoteDataSource {}

void main() {
  late AuthenticationRemoteDataSource remoteDataSource;
  late AuthenticationRepositoryImplementation repoImpl;
  setUp(() {
    remoteDataSource = MockAuthRemoteDataSrc();
    repoImpl = AuthenticationRepositoryImplementation(remoteDataSource);
  });

  //t ย่อมาจาก test
  final tException = APIException(message: 'Unknown Error Occurred ', statusCode: 500);

  group('createUser', () {
    const createdAt = 'whatever.createdAt';
    const name = 'whatever.name';
    const avatar = 'whatever.avatar';
     
    test(
        'should call the [RemoteDataSource.createUser] and complete '
            'successfully when the call to the remote source is successful',
            () async {
          ////check that remote source's createUser gets and with right data.
          //Arrange
          when(() =>
              remoteDataSource.createUser(
                createdAt: any(named: 'createdAt'),
                name: any(named: 'name'),
                avatar: any(named: 'avatar'),
              )).thenAnswer((_) async => Future.value());

         

          //Act
          final result = await repoImpl.createUser(
              createdAt: createdAt, name: name, avatar: avatar);

          //Assert
          expect(result, equals(const Right(null)));

          //check ว่าเรา call repoImpl.createUser  ด้วย params ตัวเดียวกัน ไป 1 ครั้งจริงมั้ย
          verify(() =>
              remoteDataSource.createUser(
                  createdAt: createdAt, name: name, avatar: avatar)).called(1);

          verifyNoMoreInteractions(remoteDataSource);
        });

    test(
        'should return a [ServerFailure] when the call to the remote'
            'source is unsuccessfully'
        , ()async{
      //Arrange
      when(() =>
          remoteDataSource.createUser(
            createdAt: any(named: 'createdAt'),
            name: any(named: 'name'),
            avatar: any(named: 'avatar'),
          )).thenThrow(tException);

      //Act
      final result = await repoImpl.createUser(createdAt: createdAt, name: name, avatar: avatar);

      //Assert  //Left คือ กรณี Error
      expect(result, equals(Left(APIFailure(message: tException.message,statusCode:  tException.statusCode))));

      verify(()=>remoteDataSource.createUser(createdAt: createdAt, name: name, avatar: avatar)).called(1);
      verifyNoMoreInteractions(remoteDataSource);

    });
  });
  

}
