import 'package:flutter/material.dart';
import 'package:user_settings/preference_service.dart';
import 'package:user_settings/settings_model.dart';

import 'models.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _preferenceService=PreferenceService();
  final userNameController=TextEditingController();
  var _selectedGender=Gender.MALE;
  var _selectedLanguage=Set<ProgrammingLanguage>();
  bool _isEmployed=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    populateSettings();
  }

  void populateSettings()async{
    final settings= await _preferenceService.getSettings();
    setState(() {
      userNameController.text = settings.userName;
      _selectedGender = settings.gender;
      _selectedLanguage = settings.programmingLanguage;
      _isEmployed = settings.isEmployed;
    });
  }

  void _saveSettings() {
    final newSettings = Settings(
        userName: userNameController.text,
        gender: _selectedGender,
        programmingLanguage: _selectedLanguage,
        isEmployed: _isEmployed);
    print(newSettings);
    _preferenceService.saveSettings(newSettings);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Settings'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: TextField(
                controller: userNameController,
                decoration: InputDecoration(
                  labelText: 'User Name'
                ),
              ),

            ),
            RadioListTile(
              title: Text('Male'),
                value: Gender.MALE,
                groupValue: _selectedGender,
                onChanged: (radioValue)=>
                  setState(()=> _selectedGender=radioValue as Gender)
                ),
            RadioListTile(
                title: Text('Female'),
                value: Gender.FEMALE,
                groupValue: _selectedGender,
                onChanged: (radioValue)=>
                    setState(()=> _selectedGender=radioValue as Gender)
            ),
            RadioListTile(
                title: Text('Other'),
                value: Gender.OTHER,
                groupValue: _selectedGender,
                onChanged: (radioValue)=>
                    setState(()=> _selectedGender=radioValue as Gender)
            ),
            CheckboxListTile(
              title: Text('Dart'),
                value: _selectedLanguage.contains(ProgrammingLanguage.DART),
                onChanged: (_) {
                  setState(() {
                    _selectedLanguage.contains(ProgrammingLanguage.DART)?
                    _selectedLanguage.remove(ProgrammingLanguage.DART):
                    _selectedLanguage.add(ProgrammingLanguage.DART);
                  });
                }
                ),
            CheckboxListTile(
                title: Text('Java'),
                value: _selectedLanguage.contains(ProgrammingLanguage.JAVA),
                onChanged: (_) {
                  setState(() {
                    _selectedLanguage.contains(ProgrammingLanguage.JAVA)?
                    _selectedLanguage.remove(ProgrammingLanguage.JAVA):
                    _selectedLanguage.add(ProgrammingLanguage.JAVA);
                  });
                }
            ),
            CheckboxListTile(
                title: Text('Kotlin'),
                value: _selectedLanguage.contains(ProgrammingLanguage.KOTLIN),
                onChanged: (_) {
                  setState(() {
                    _selectedLanguage.contains(ProgrammingLanguage.KOTLIN)?
                        _selectedLanguage.remove(ProgrammingLanguage.KOTLIN):
                        _selectedLanguage.add(ProgrammingLanguage.KOTLIN);
                  });
                }
            ),
            CheckboxListTile(
                title: Text('Swift'),
                value: _selectedLanguage.contains(ProgrammingLanguage.SWIFT),
                onChanged: (_) {
                  setState(() {
                    _selectedLanguage.contains(ProgrammingLanguage.SWIFT)?
                    _selectedLanguage.remove(ProgrammingLanguage.SWIFT):
                    _selectedLanguage.add(ProgrammingLanguage.SWIFT);
                  });
                }
            ),
            SwitchListTile(
              title: Text('Is Employed '),
                value: _isEmployed,
                onChanged: (newValue)=>setState(()=>_isEmployed=newValue)),
            TextButton(onPressed: _saveSettings, child: Text('Save Settings'))
          ],
        ),
      ),
    );
  }


}
