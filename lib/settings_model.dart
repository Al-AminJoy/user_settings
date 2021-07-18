import 'package:user_settings/models.dart';

class Settings{
    final String userName;
    final Gender gender;
    final Set<ProgrammingLanguage> programmingLanguage;
    final bool isEmployed;

    Settings(
    {required this.userName, required this.gender, required this.programmingLanguage, required this.isEmployed});

    @override
  String toString() {
    return 'Settings{userName: $userName, gender: $gender, programmingLanguage: $programmingLanguage, isEmployed: $isEmployed}';
  }
}