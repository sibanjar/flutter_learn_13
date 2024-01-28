class Person {
  final String name;
  final String address;

  Person({
    required this.name,
    required this.address,
  });

  @override
  String toString() {
    return name;
  }


}
