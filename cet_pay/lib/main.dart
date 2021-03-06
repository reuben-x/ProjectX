import 'package:cet_pay/models/user.dart';
import 'package:cet_pay/services/auth.dart';
import 'package:cet_pay/screens/wrapper.dart';
import 'package:cet_pay/dark_mode/provider.dart';
import 'package:cet_pay/dark_mode/themeData.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return
      ChangeNotifierProvider(
        create: (_) {
          return themeChangeProvider;
        },
        child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget child) {
            return StreamProvider<UserProfile>.value(
              value: AuthService().user,
              child: new MaterialApp(
                theme: Styles.themeData(themeChangeProvider.darkTheme, context),
                debugShowCheckedModeBanner: false,
                home: Wrapper(),
              ),
            );
          },
        ),);

  }
}
