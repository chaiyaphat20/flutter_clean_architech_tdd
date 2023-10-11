void main() {
  final callableClass = CallableClas();
  callableClass("Gogo");
}

class CallableClas{
  void call(String message){
    print("Hello world $message");
  }
}
