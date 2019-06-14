class UserDetails {
  final int id;
  final String token;

  UserDetails({
    this.id,
    this.token,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'token': token};
  }
}
