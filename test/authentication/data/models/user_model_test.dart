import 'dart:convert';
import 'dart:io';

import 'package:flutter_clean_architech_tdd/core/utils/typedef.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/data/models/user_model.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';


void main(){
  const tModel = UserModel.empty();

  test('should be a subclass of [User] entity', ()  {
    //Arrange
    //Act

    //Assert
    expect(tModel, isA<User>());
  });

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group("formMap", () {
    test('should be a [UserModel] with the right data', (){
      //Arrange
      //Act
      final result = UserModel.fromMap(tMap);

      //Assert
      expect(result, equals(tModel));
    });
  });

  group("formJson", () {
    test('should be a [JSON ] with the right data', (){
      //Arrange
      //Act
      final result = UserModel.fromJson(tJson);

      //Assert
      expect(result, equals(tModel));
    });
  });

  group("toMap", () {
   test('should return a [Map] with the right data', (){
     //Arrange
     //Act
     final result = tModel.toMap();

     //Assert
     expect(result, equals(tMap));
   });
  });

  group("toJson", () {
    test('should return a [JSON] with the right data', (){
      //Arrange
      //Act
      final result = tModel.toJson();
      final tJson = jsonEncode({
        "id": "1",
        "avatar": "_empty.avatar",
        "createdAt": "_empty.createdAt",
        "name": "_empty.name"
      });

      //Assert
      expect(result, equals(tJson));
    });
  });

  group("copyWith", () {
    test('should return a [UserModel] with different data', (){
      //Arrange
      //Act
      final result = tModel.copyWith(name: "Art");

      //Assert
      expect(result.name, equals('Art'));
    });
  });
}