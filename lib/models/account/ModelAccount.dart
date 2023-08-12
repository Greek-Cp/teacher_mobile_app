import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ModelAboutUser {
  String FirstName;
  String LastName;
  String CountryOfResidence;

  ModelAboutUser({
    required this.FirstName,
    required this.LastName,
    required this.CountryOfResidence,
  });

  factory ModelAboutUser.fromJson(Map<String, dynamic> json) => ModelAboutUser(
        FirstName: json['FirstName'],
        LastName: json['LastName'],
        CountryOfResidence: json['CountryOfResidence'],
      );

  Map<String, dynamic> toJson() => {
        'FirstName': FirstName,
        'LastName': LastName,
        'CountryOfResidence': CountryOfResidence,
      };
}

class ModelPhoneUser {
  int PhoneNumber;
  int CountryId;
  bool StatusVerify;

  ModelPhoneUser({
    required this.PhoneNumber,
    required this.CountryId,
    required this.StatusVerify,
  });

  factory ModelPhoneUser.fromJson(Map<String, dynamic> json) => ModelPhoneUser(
        PhoneNumber: json['PhoneNumber'],
        CountryId: json['CountryId'],
        StatusVerify: json['StatusVerify'],
      );

  Map<String, dynamic> toJson() => {
        'PhoneNumber': PhoneNumber,
        'CountryId': CountryId,
        'StatusVerify': StatusVerify,
      };
}

class ModelLanguageTeach {
  List<String> languageTeachSelect;

  ModelLanguageTeach({
    required this.languageTeachSelect,
  });

  factory ModelLanguageTeach.fromJson(Map<String, dynamic> json) =>
      ModelLanguageTeach(languageTeachSelect: List<String>.from(json['languageTeachSelect']));

  Map<String, dynamic> toJson() => {
        'languageTeachSelect': languageTeachSelect,
      };
}

class ModelDataTeachingExperiences {
  String Experience;
  int LengthExperience;

  ModelDataTeachingExperiences({
    required this.Experience,
    required this.LengthExperience,
  });

  factory ModelDataTeachingExperiences.fromJson(Map<String, dynamic> json) =>
      ModelDataTeachingExperiences(
        Experience: json['Experience'],
        LengthExperience: json['LengthExperience'],
      );

  Map<String, dynamic> toJson() => {
        'Experience': Experience,
        'LengthExperience': LengthExperience,
      };
}

class ModelTeachingExperiences {
  List<ModelDataTeachingExperiences> listTeachingExperience;

  ModelTeachingExperiences({
    required this.listTeachingExperience,
  });

  factory ModelTeachingExperiences.fromJson(Map<String, dynamic> json) =>
      ModelTeachingExperiences(
        listTeachingExperience: (json['listTeachingExperience'] as List)
            .map((e) => ModelDataTeachingExperiences.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'listTeachingExperience':
            listTeachingExperience.map((e) => e.toJson()).toList(),
      };
}

class ModelDataEducation {
  String EducationLevel;
  String Subject;
  int CompletionYear;

  ModelDataEducation({
    required this.EducationLevel,
    required this.Subject,
    required this.CompletionYear,
  });

  factory ModelDataEducation.fromJson(Map<String, dynamic> json) =>
      ModelDataEducation(
        EducationLevel: json['EducationLevel'],
        Subject: json['Subject'],
        CompletionYear: json['CompletionYear'],
      );

  Map<String, dynamic> toJson() => {
        'EducationLevel': EducationLevel,
        'Subject': Subject,
        'CompletionYear': CompletionYear,
      };
}

class ModelEducationUser {
  List<ModelDataEducation> ListEducationUser;

  ModelEducationUser({
    required this.ListEducationUser,
  });

  factory ModelEducationUser.fromJson(Map<String, dynamic> json) =>
      ModelEducationUser(
        ListEducationUser: (json['ListEducationUser'] as List)
            .map((e) => ModelDataEducation.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'ListEducationUser':
            ListEducationUser.map((e) => e.toJson()).toList(),
      };
}

class ModelDescriptionUser {
  String shortDescription;
  String longDescription;

  ModelDescriptionUser({
    required this.shortDescription,
    required this.longDescription,
  });

  factory ModelDescriptionUser.fromJson(Map<String, dynamic> json) =>
      ModelDescriptionUser(
        shortDescription: json['shortDescription'],
        longDescription: json['longDescription'],
      );

  Map<String, dynamic> toJson() => {
        'shortDescription': shortDescription,
        'longDescription': longDescription,
      };
}

class ModelAddedVideoData {
  String pathVideoStorage;

  ModelAddedVideoData({
    required this.pathVideoStorage,
  });

  factory ModelAddedVideoData.fromJson(Map<String, dynamic> json) =>
      ModelAddedVideoData(
        pathVideoStorage: json['pathVideoStorage'],
      );

  Map<String, dynamic> toJson() => {
        'pathVideoStorage': pathVideoStorage,
      };
}

class VideoAddedUser {
  List<ModelAddedVideoData> listVideoAdded;

  VideoAddedUser({
    required this.listVideoAdded,
  });

  factory VideoAddedUser.fromJson(Map<String, dynamic> json) => VideoAddedUser(
        listVideoAdded: (json['listVideoAdded'] as List)
            .map((e) => ModelAddedVideoData.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'listVideoAdded': listVideoAdded.map((e) => e.toJson()).toList(),
      };
}

class ModelProfileUser {
  String idUser;
  String Username;
  ModelAboutUser about;
  ModelPhoneUser phoneNumber;
  ModelLanguageTeach languageTeachSelectedByUser;
  ModelTeachingExperiences experiencesUser;
  ModelEducationUser educationUser;
  ModelDescriptionUser descriptionUser;

  ModelProfileUser({
    required this.idUser,
    required this.Username,
    required this.about,
    required this.phoneNumber,
    required this.languageTeachSelectedByUser,
    required this.experiencesUser,
    required this.educationUser,
    required this.descriptionUser,
  });

  factory ModelProfileUser.fromJson(Map<String, dynamic> json) =>
      ModelProfileUser(
        idUser: json['idUser'],
        Username: json['Username'],
        about: ModelAboutUser.fromJson(json['about']),
        phoneNumber: ModelPhoneUser.fromJson(json['phoneNumber']),
        languageTeachSelectedByUser:
            ModelLanguageTeach.fromJson(json['languageTeachSelectedByUser']),
        experiencesUser: ModelTeachingExperiences.fromJson(json['experiencesUser']),
        educationUser: ModelEducationUser.fromJson(json['educationUser']),
        descriptionUser: ModelDescriptionUser.fromJson(json['descriptionUser']),
      );

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'Username': Username,
        'about': about.toJson(),
        'phoneNumber': phoneNumber.toJson(),
        'languageTeachSelectedByUser': languageTeachSelectedByUser.toJson(),
        'experiencesUser': experiencesUser.toJson(),
        'educationUser': educationUser.toJson(),
        'descriptionUser': descriptionUser.toJson(),
      };
}

class SharedPrefUtil {
  static const String keyProfileUser = 'keyProfileUser';

  static Future<void> saveProfileUser(ModelProfileUser profile) async {
    final prefs = await SharedPreferences.getInstance();
    final profileJson = json.encode(profile.toJson());
    await prefs.setString(keyProfileUser, profileJson);
  }

  static Future<ModelProfileUser?> getProfileUser() async {
    final prefs = await SharedPreferences.getInstance();
    final profileJson = prefs.getString(keyProfileUser);
    if (profileJson != null) {
      final profileMap = json.decode(profileJson) as Map<String, dynamic>;
      return ModelProfileUser.fromJson(profileMap);
    }
    return null;
  }
}
