class UserDob {
  final DateTime date;
  final int age;

  UserDob({
    required this.age,
    required this.date,
  });

  factory UserDob.fromMap(Map<String, dynamic> user) {
    final date = user['date'];
    return UserDob(
      age: user['age'],
      date: DateTime.parse(date),
    );
  }
}
