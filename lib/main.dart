import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'package:cabgo_driver/states/app_state.dart';
import 'flutter_flow/internationalization.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

///Receive message when app is in background solution for on message
Future<void> backgroundHandler(RemoteMessage message) async{
  print(message.data.toString());
  print(message.notification.title);
}

Future<void> main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterFlowTheme.initialize();
  //firebase initialization
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  //end
  runApp( MultiProvider(providers: [
    ChangeNotifierProvider.value(value:AppState(),)
  ],
    child: MyApp(),));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  GoRouter _router;

  void setLocale(Locale value) => setState(() {
    _locale = value;
  });
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });



  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    if (appState.isLoggedIn) {
      return MaterialApp(
        title: 'Cabgo',
        localizationsDelegates: [
          FFLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: _locale,
        supportedLocales: const [Locale('en', '')],
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: _themeMode,
        home: DocumentsPageWidget(),
      );
    }else{
      return MaterialApp(
        title: 'Cabgo',
        localizationsDelegates: [
          FFLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: _locale,
        supportedLocales: const [Locale('en', '')],
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: _themeMode,
        home: HomePageWidget(),
      );
    }
  }
}
