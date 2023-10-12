import 'package:dartz/dartz.dart';
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

  group('createUser', () {
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

          const createdAt = 'whatever.createdAt';
          const name = 'whatever.name';
          const avatar = 'whatever.avatar';

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
  });
}
