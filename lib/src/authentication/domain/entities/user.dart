import 'package:equatable/equatable.dart';

class User extends Equatable{
  const User({
    required this.id,
    required this.avatar,
    required this.createdAt,
    required this.name,
  });

  const User.empty():this(id: "1",avatar: '_empty.avatar',createdAt: '_empty.createdAt',name: '_empty.name');

  final String id;
  final String avatar;
  final String createdAt;
  final String name;

  
  @override
  List<Object?> get props => [id,name,avatar];


//ถ้าต้องการให้ตัวไหน check ว่าเท่ากัน ให้เขียนอยู่ใน []
  //[id] ถ้า id ของ object เท่ากัน เมื่อ ใช้ == กับ object จะได้ true
}

// void main(){
//   final user = User.empty();
//   user.name = 'bing';
// }
