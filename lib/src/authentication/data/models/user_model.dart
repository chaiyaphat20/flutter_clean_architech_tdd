import 'dart:convert';

import 'package:flutter_clean_architech_tdd/core/utils/typedef.dart';
import 'package:flutter_clean_architech_tdd/src/authentication/domain/entities/user.dart';

//Model ใช้ Map ข้อมูลกับ API ไม่ก็ DB
//Entity ใช้เป็น Type
//เรามักจะ Extens Model จาก Entity
class UserModel extends User {
  const UserModel({
    required super.id,
    required super.avatar,
    required super.createdAt, 
    required super.name,
  });

  //เขียนเพิ่มเอง
  //ใช้ สำหรับการเขียน TDD เท่านั้น
  const UserModel.empty():this(id: "1",avatar: '_empty.avatar',createdAt: '_empty.createdAt',name: '_empty.name');

  factory UserModel.fromJson(String source) => UserModel.fromMap(jsonDecode(source) as DataMap);
  //

  UserModel.fromMap(DataMap map): this (
    avatar: map['avatar'] as String,
    id: map['id'] as String,
    createdAt: map['createdAt'] as String,
    name: map['name'] as String,
  );

  UserModel copyWith({
    String? id,
    String? avatar,
    String? createdAt,
    String? name,
  }) {
    return UserModel(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'avatar': this.avatar,
      'createdAt': this.createdAt,
      'name': this.name,
    };
  }

  String toJson() => jsonEncode(toMap());


}
