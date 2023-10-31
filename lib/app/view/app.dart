import 'package:flutter/material.dart';
import 'package:site_diary_app/diary/counter.dart';
import 'package:site_diary_app/diary/view/new_entry_page.dart';
import 'package:site_diary_app/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => const HomePage(),
        NewEntryPage.route: (context) => const NewEntryPage(),
      },
    );
  }
}
