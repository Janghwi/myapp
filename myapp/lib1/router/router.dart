import 'package:flutter/material.dart';

import '../getphrases101b.dart';
import '../getphrases103.dart';
import '../splashhome.dart';
import '../homepage.dart';
import '../secondmenu10.dart';
import 'routing_constants.dart';
import 'undefined_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashViewRoute:
      return MaterialPageRoute(builder: (context) => SplashHome());
    case LoginViewRoute:
      return MaterialPageRoute(builder: (context) => HomePage());
    case HomepageViewRoute:
      return MaterialPageRoute(builder: (context) => HomePage());
    case MenuViewRoute:
      var menuArgument = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => SecondMenu10(argument: menuArgument));
    case PhraseViewRoute:
      var menuArgument = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => GetPhrases103(argument: menuArgument));
    case PhraseViewRoute1:
      var menuArgument = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => GetPhrases101b(argument: menuArgument));
    default:
      return MaterialPageRoute(
          builder: (context) => UndefinedView(
                name: settings.name,
              ));
  }
}
