class PubnubToken {
  final String token;

  PubnubToken({required this.token});

  factory PubnubToken.fromJson(Map<String, dynamic> json) {
    return PubnubToken(
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}
