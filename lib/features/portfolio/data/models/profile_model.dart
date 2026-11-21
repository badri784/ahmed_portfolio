import '../../domain/entities/profile.dart';

class ProfileModel {
  const ProfileModel({
    required this.name,
    required this.headline,
    required this.intro,
    required this.about,
    required this.githubUrl,
    required this.linkedinUrl,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) => ProfileModel(
        name: map['name'] as String,
        headline: map['headline'] as String,
        intro: map['intro'] as String,
        about: map['about'] as String,
        githubUrl: map['githubUrl'] as String,
        linkedinUrl: map['linkedinUrl'] as String,
      );

  final String name, headline, intro, about, githubUrl, linkedinUrl;

  Profile toEntity() => Profile(
        name: name,
        headline: headline,
        intro: intro,
        about: about,
        githubUrl: githubUrl,
        linkedinUrl: linkedinUrl,
      );
}
