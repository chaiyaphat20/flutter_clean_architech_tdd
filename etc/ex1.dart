
void main() {
  final now = DateTime.now();
  final tomorow = DateTime.now().add(const Duration(hours:24));
  final user1 =
      User(id: 1, createdAt: now, name: "name", avatar: "avatar");

  final user2 =
      User(id: 1, createdAt: tomorow, name: "name", avatar: "avatar");
  
  print(user1==user2);
}

class User {
  const User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  final int id;
  final DateTime createdAt;
  final String name;
  final String avatar;
  
  @override
  bool operator==(other){
    return identical(this,other) ||
      other is User &&
      other.runtimeType == this.runtimeType &&
      other.name == this.name &&
      other.id ==this.id;
  }
  
  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}



// https://pub.dev/packages/equatable/example