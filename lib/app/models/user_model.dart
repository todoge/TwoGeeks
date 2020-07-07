// model for user
import 'package:twoGeeks/app/models/user_preference_model.dart';

class UserModel {
  final String name;
  final String age;
  final String country;
  final String currentSchool;
  final String currentSchoolYear;
  final String aboutMe;
  final String gender;
  final String profilePic;
  final bool tutor;
  final UserPreferenceModel userPreference;
  final strength;
  final weakness;
  final hobbies;
  final friends_user_uid;

  UserModel(
      {this.name,
      this.age,
      this.country,
      this.currentSchool,
      this.currentSchoolYear,
      this.aboutMe,
      this.gender,
      this.profilePic,
      this.strength,
      this.weakness,
      this.userPreference,
      this.tutor,
      this.hobbies,
      this.friends_user_uid});

  static dynamic _ifEmpty(dynamic value, dynamic altVal) {
    if (value == null || value == "") {
      return altVal;
    }
    return value;
  }

  factory UserModel.fromMap(Map<String, dynamic> data) {
    if (data.isEmpty) {
      return null;
    }
    final String name = _ifEmpty(data["name"], "No name given").toString();
    final String age = _ifEmpty(data["age"], "undefined").toString();
    final String country = _ifEmpty(data["country"], "undefined").toString();
    final String currentSchool =
        _ifEmpty(data["currentSchool"], "undefined").toString();
    final String currentSchoolYear =
        _ifEmpty(data["currentSchoolYear"], "Others").toString();
    final String aboutMe = _ifEmpty(data["aboutMe"], "").toString();
    final String gender = _ifEmpty(data["gender"], "neutral").toString();
    final String profilePic = _ifEmpty(data["profilePic"], "").toString();
    final strength = _ifEmpty(data["strength"], []);
    final weakness = _ifEmpty(data["weakness"], []);
    final hobbies = _ifEmpty(data["hobbies"], []);
    final tutor = _ifEmpty(data["tutor"], false);
    final friends_user_uid = _ifEmpty(data["friends_user_uid"], []);
//
    UserPreferenceModel _emptyPreferenceModel =
        new UserPreferenceModel(currentSchoolYear: "Others", gender: "neutral");
//
//    final userPreference = _ifEmpty(
//        UserPreferenceModel(
//            gender: _ifEmpty(data["preferences"]["gender"], "neutral"),
//            currentSchoolYear:
//                _ifEmpty(data["preferences"]["currentSchoolYear"], "Others")),
//        _emptyPreferenceModel);

    final userPreference = _emptyPreferenceModel;

    return UserModel(
        name: name,
        age: age,
        country: country,
        currentSchool: currentSchool,
        currentSchoolYear: currentSchoolYear,
        aboutMe: aboutMe,
        gender: gender,
        profilePic: profilePic,
        strength: strength,
        weakness: weakness,
        hobbies: hobbies,
        userPreference: userPreference,
        tutor: tutor,
        friends_user_uid: friends_user_uid);
  }
}