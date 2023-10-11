import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/domain/usecases/create_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthenticationRepository {}

void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;

  setUpAll(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
  });

  final params = CreateUserParams.empty();

  test('should call the [AuthRepository.CreateUser]', () async {
    //Arrange
    //STUB
    when(() => repository.createUser(createdAt: any(named: 'createdAt'), name: any(named: 'name'), avatar: any(named: 'avatar'))).thenAnswer((_) async => Right(null));

    //Act
    final result = await usecase(params);

    //Assert
    expect(result, equals(const Right<dynamic,void>(null)));
    verify(() => repository.createUser(createdAt: params.createdAt, name: params.name, avatar: params.avatar)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
//2:33:06


//any(named: 'parameterName') ในการเรียก when() ใน Mocktail library ใช้เพื่อระบุว่าคุณไม่สนใจค่าที่ถูกส่งเข้ามาในพารามิเตอร์ที่กำหนดชื่อและคุณต้องการให้ Mocktail รับค่าใดก็ได้ในพารามิเตอร์นั้น 

/**
 * Right คือคลาส Right ของ Dartz
<dynamic, void> คือการระบุประเภทข้อมูลสำหรับ Left และ Right โดยที่ Left ไม่ได้ใช้ในที่นี้ (dynamic) และ Right ถูกกำหนดให้เป็น void ซึ่งหมายถึงไม่มีค่าข้อมูลเพิ่มเติมที่ถูกนำมาใช้
(null) คือค่าที่ถูกเก็บใน Right ซึ่งในกรณีนี้คือ null แสดงถึงความสำเร็จโดยไม่มีข้อมูลเพิ่มเติม
ในส่วนของการจัดการข้อผิดพลาดและความสำเร็จใน Dartz, เรามักใช้ Left แทนค่าที่เกิดข้อผิดพลาดและ Right แทนค่าที่ถูกต้องหรือคำตอบที่ถูกต้อง เพื่อให้ง่ายต่อการจัดการและแยกแยะระหว่างกรณีที่มีข้อผิดพลาดและไม่มีข้อผิดพลาดในการประมวลผลข้อมูลหรือการดำเนินการต่างๆ ในแอปพลิเคชัน Dart.
 */