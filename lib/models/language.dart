import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_template/models/shared_prefs.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Language extends ChangeNotifier {
  final List<Locale> _availableLangs = const [
    Locale("en"),
    Locale("ar"),
    Locale("fr"),
    Locale("es")
  ];
  late int _langIndex;

  initializeIndex() {
    _langIndex = prefs.getInt("langIndex") ?? 0;
  }

  Locale get currentLang => _availableLangs[_langIndex];
  List<Locale> get locales => _availableLangs;
  int get currentIndex => _langIndex;

  setLangIndex({required BuildContext context, required int index}) {
    _langIndex = index;
    context.read<SharedPreferences>().setInt("langInex", index);
    notifyListeners();
    Restart.restartApp();
  }
}
