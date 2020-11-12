import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teamconnect/general/resources/app_themes.dart';

class General with ChangeNotifier, DiagnosticableTreeMixin {
  // PRIVATE VARS
  Locale _selectedLanguage = Locale('en');
  List<String> _availableLanguages = ['en', 'ro'];
  AppTheme _selectedThemeData = lightTheme;

  //GETTERS
  Locale get selectedLanguge => _selectedLanguage;
  List<String> get allLanguages => _availableLanguages;
  AppTheme get activeThemeData => _selectedThemeData;

  void changeTheme(AppTheme newThemeData) {
    _selectedThemeData = newThemeData;
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
