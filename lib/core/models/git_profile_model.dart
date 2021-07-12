// To parse this JSON data, do
//
//     final gitUserData = gitUserDataFromMap(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

class GitProfileModel {
  GitProfileModel({
    required this.login,
    required this.nodeId,
    required this.avatarUrl,
    required this.name,
    required this.blog,
    required this.location,
    required this.bio,
    required this.publicRepos,
    required this.followers,
    required this.following,
    required this.createdAt,
  });

  final String login;
  final String nodeId;
  final String avatarUrl;
  final String name;
  final String blog;
  final String location;
  final String bio;
  final int publicRepos;
  final int followers;
  final int following;
  final DateTime createdAt;

  factory GitProfileModel.fromJson(String str) =>
      GitProfileModel.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory GitProfileModel.fromMap(Map<String, dynamic> json) => GitProfileModel(
        login: json["login"] ?? '',
        nodeId: json["node_id"] ?? '',
        avatarUrl: json["avatar_url"] ?? '',
        name: json["name"] ?? '',
        blog: json["blog"].toString() == "" ? "Not Provided" : json["blog"],
        location:
            (json["location"].toString() == "" || json["location"] == null)
                ? "Not Provided"
                : json["location"],
        bio: json["bio"] ?? "",
        publicRepos: json["public_repos"] ?? 0,
        followers: json["followers"] ?? 0,
        following: json["following"] ?? 0,
        createdAt: DateTime.parse(json["created_at"]),
      );

  static dummyMap() => {
        "login": 'login',
        "node_id": 'nodeId',
        "avatar_url": 'avatarUrl',
        "name": 'name',
        "blog": 'blog',
        "location": 'location',
        "bio": 'bio',
        "public_repos": 0,
        "followers": 0,
        "following": 0,
        "created_at": DateTime.now(),
      };

  static String statusInfo(GitProfileModel data) {
    if (data.publicRepos < 20) return "Upcoming Open Source Engineer";
    if (data.publicRepos >= 20 && data.publicRepos < 50)
      return "Junior Open Source Engineer";
    return "Senior Open Source Engineer";
  }

  static String formatDate(DateTime time) {
    DateFormat formatter = DateFormat.yMMMMd();
    return formatter.format(time);
  }
}
