import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_settings/models.dart';
import 'package:user_settings/settings_model.dart';

class PreferenceService {
  Future saveSettings(Settings settings) async {
    final preference = await SharedPreferences.getInstance();

    await preference.setBool('isEmployed', settings.isEmployed);
    await preference.setString('userName', settings.userName);
    await preference.setInt('gender', settings.gender.index);
    await preference.setStringList(
        'programmingLanguage',
        settings.programmingLanguage
            .map((lang) => lang.index.toString())
            .toList());
    print('Saved');
  }
  
  Future<Settings> getSettings()async{
    final preference = await SharedPreferences.getInstance();
     final isEmployed = preference.getBool('isEmployed') as bool;
     final userName= preference.getString('userName') as String;
     final gender = Gender.values[preference.getInt('gender')??0];

     final programmingLanguagePref = preference.getStringList('programmingLanguage');

     final programmingLanguage = programmingLanguagePref!
         .map((lang) => ProgrammingLanguage
         .values[int.parse(lang)]).toSet();

     return Settings(userName: userName, gender: gender, programmingLanguage: programmingLanguage, isEmployed: isEmployed);

  }
}
