import 'dart:convert';

import 'package:flutter_clean_architech_tdd/core/errors/exception.dart';
import 'package:flutter_clean_architech_tdd/core/utils/typedef.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/data/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/utils/constants.dart';

abstract class AuthenticationRemoteDataSource {
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<List<UserModel>> getUsers();
}

const kCreateUserEndpoint = '/test-api/users';
const kGetUserEndpoint = "/test-api/users";

class AuthRemoteDataSourceImpl implements AuthenticationRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._client);

  final http.Client _client;

  @override
  Future<void> createUser(
      {required String createdAt,
      required String name,
      required String avatar}) async {
    //1.check to make sure that it returns the right data when status code is 200
    //or the proper response code
    //2.check to make sure that it "THROW A CUSTOM EXCEPTION" with the right message
    //when status code is the one base
    try {
      final response = await _client.post(
          Uri.https(kBaseUrl, kCreateUserEndpoint),
          body: jsonEncode(
              {'createdAt': createdAt, 'name': name, 'avatar': avatar}),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode != 201) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
    } on APIException {
      rethrow; // throw APIException(
      //message: response.body, statusCode: response.statusCode);
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await _client.get(Uri.https(kBaseUrl, kGetUserEndpoint));
      if (response.statusCode != 200) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((userData) => UserModel.fromMap(userData))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }
}
