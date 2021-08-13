import 'package:flutter/material.dart';

import 'homepage.dart';
import 'router/routing_constants.dart';
import 'router/router.dart' as router;
import 'package:splashscreen/splashscreen.dart';

class SplashHome extends StatelessWidget {
  const SplashHome({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enkornese',
      home: Scaffold(
      body: Center(
        child: SplashScreen(
        seconds: 2,
        navigateAfterSeconds: HomePage(),
        title: new Text('This App \nhelp you learn \nthe English, Korean and Japanese \nat the same time',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),),
        image: new Image.asset(
                              "images/01.png",
                              width: 200,
                              height: 200,
                              alignment: Alignment.bottomRight,
                              color: Color(0xFF303943).withOpacity(0.5),
                            ),
        backgroundColor: Colors.yellow,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("Flutter Egypt"),
        loaderColor: Colors.red
        ),
      ),
        
    ),
      onGenerateRoute: router.generateRoute,
      initialRoute: SplashViewRoute,
            // routes: {
            //   'cat1_view': (context) => BasicWidgets(),
            //   'cat2_view': (context) =>
            //       GetPhrases12(screenTitle: 'abc', firestoreName: 'weather'),
            //   'cat3_view': (context) =>
            //       GetPhrases01(screenTitle: 'abc', firestoreName: 'weather'),
            //   'cat4_view': (context) =>
            //       GetPhrases11(screenTitle: 'abc', firestoreName: 'weather'),
            //   'cat5_view': (context) => SecondMenu1(firestoreName: 'menu11'),
            //   'cat6_view': (context) =>
            //       GetPhrases13(screenTitle: 'abc', firestoreName: 'weather'),
            //   'cat7_view': (context) => SecondMenu2(firestoreName: 'could.you'),
            //   'cat8_view': (context) => SecondMenu3(firestoreName: 'temphangul'),
            //   // 'grid_view': (context) => GridViewDemo(),
            //   // 'custom_icons': (context) => CustomIconsDemo(),
            //   // 'sliver_widgets': (context) => SliverWidgetsDemo()
            // },
          );
        }
      }
      
  