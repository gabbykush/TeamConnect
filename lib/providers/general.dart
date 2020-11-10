import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teamconnect/general/resources/app_themes.dart';

enum _GeneralProviderKeys { selectedLanguage }

class General with ChangeNotifier, DiagnosticableTreeMixin {
  General() {
    _getSelectedLanguageFromSharedPreferences();
  }

  // PRIVATE VARS
  Locale _selectedLanguage = Locale('en');
  List<String> _availableLanguages = ['en', 'ro'];
  AppTheme _selectedThemeData = lightTheme;

  //GETTERS
  Locale get selectedLanguge => _selectedLanguage;
  List<String> get allLanguages => _availableLanguages;
  AppTheme get activeThemeData => _selectedThemeData;

  // FUNCTIONS
  void setLanguage(String newLanguage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _GeneralProviderKeys.selectedLanguage.toString(), newLanguage);
    _selectedLanguage = Locale(newLanguage);
    notifyListeners();
  }

  void changeTheme(AppTheme newThemeData) {
    _selectedThemeData = newThemeData;
    notifyListeners();
  }

  _getSelectedLanguageFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final languageCode =
        prefs.getString(_GeneralProviderKeys.selectedLanguage.toString());
    _selectedLanguage = Locale(languageCode ?? 'ro');
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty(
        'selected Language:', _selectedLanguage.languageCode.toString()));
    properties
        .add(StringProperty('all Languages:', _availableLanguages.join(',')));
  }
}
