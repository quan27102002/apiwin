class Username {
  final String title;
  final String first;
  final String last;
  Username({
    required this.first,
    required this.title,
    required this.last,
  });

  factory Username.fromMap(Map<String, dynamic> user){
    return Username(
      first: user['first'],
      title: user['title'],
      last: user['last'],
    );
  }
}
