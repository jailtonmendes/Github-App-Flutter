import 'dart:convert';

class GithubModel {
  final String name;
  final String avatarUrl;
  final String blog;
  final String location;
  final int publicRepos;

  GithubModel({
    required this.name,
    required this.avatarUrl,
    required this.blog,
    required this.publicRepos,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'avatar_url': avatarUrl,
      'blog': blog,
      'public_repos': publicRepos,
      'location': location
    };
  }

  factory GithubModel.fromMap(Map<String, dynamic> map) {
    return GithubModel(
      name: map['name'] ?? '',
      avatarUrl: map['avatar_url'] ?? '',
      blog: map['blog'],
      publicRepos: map['public_repos'],
      location: map['location'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubModel.fromJson(String source) =>
      GithubModel.fromMap(json.decode(source));
}
