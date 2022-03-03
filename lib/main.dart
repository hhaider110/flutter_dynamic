import 'package:flutter/material.dart';
import 'package:flutter_app_locale/LanguageChangeProvider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'generated/l10n.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_locale/constants/constants.dart';
import 'package:flutter_app_locale/l10n/l10n.dart';
import 'package:flutter_app_locale/screens/dashboard.dart';
import 'package:flutter_app_locale/screens/signin.dart';
import 'package:flutter_app_locale/screens/signup.dart';
import 'package:flutter_app_locale/screens/home.dart';
import 'package:flutter_app_locale/utils/menu_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider <MenuController>(
          create: (context) => MenuController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Login",
          locale: Provider.of<LanguageChangeProvider>(context, listen: true).currentLocale,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
        routes: <String, WidgetBuilder>{
          SIGN_IN: (BuildContext context) =>  const SignInPage(),
          SIGN_UP: (BuildContext context) =>  const SignUpScreen(),
          DASHBOARD: (BuildContext context) =>  const DashBoardScreen(),
          HOME: (BuildContext context) => const Home(),
        },
        initialRoute: SIGN_IN,

      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(S.of(context).welcomeText),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(onPressed: (){
              context.read<LanguageChangeProvider>().changeLocale("hi");
            }, child: Text("Hindi")),
            ElevatedButton(onPressed: (){
              context.read<LanguageChangeProvider>().changeLocale("en");
            }, child: Text("English")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}