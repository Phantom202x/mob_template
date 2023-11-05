import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:localization/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quiz_template/models/language.dart';
import 'package:quiz_template/models/shared_prefs.dart';
import 'package:quiz_template/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await initPrefs();
  runApp(
    ChangeNotifierProvider(
        create: (context) => Language()..initializeIndex(),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // LocalJsonLocalization.delegate.directories = ['lib/i18n'];
    return MaterialApp(
      title: "Mobeasy Template",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      locale: context.read<Language>().currentLang,
      supportedLocales: context.read<Language>().locales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // LocalJsonLocalization.delegate
      ],
      routes: {
        "/": (context) => const Home(),
      },
    );
  }
}
