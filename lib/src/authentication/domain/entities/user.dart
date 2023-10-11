import 'package:equatable/equatable.dart';

class User extends Equatable{
  const User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  const User.empty():this(id: 1,createdAt: '_empty.createdAt',avatar: '_empty.avatar',name: '_empty.name');

  final int id;
  final String createdAt;
  final String name;
  final String avatar;
  
  @override
  List<Object?> get props => [id];  
  //ถ้าต้องการให้ตัวไหน check ว่าเท่ากัน ให้เขียนอยู่ใน []
  //[id] ถ้า id ของ object เท่ากัน เมื่อ ใช้ == กับ object จะได้ true
}