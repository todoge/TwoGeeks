import 'package:flutter/material.dart';
import 'package:twoGeeks/app/Undefined/undefined.dart';
import 'package:twoGeeks/app/chat/chat.dart';
import 'package:twoGeeks/app/chatroom/chatroom.dart';
import 'package:twoGeeks/app/detail/detail.dart';
import 'package:twoGeeks/app/homepage/home_page.dart';
import 'package:twoGeeks/app/matching/matchingHandler.dart';
import 'package:twoGeeks/app/settings/user_profile.dart';
import 'package:twoGeeks/app/sign_in/sign_in_page.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/app/landing.dart';
import 'package:twoGeeks/app/settings/settings.dart';
import 'package:twoGeeks/app/sign_in/twogeeks_sign_in.dart';
import 'package:twoGeeks/app/sign_up/sign_up_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // Add more routes here
    case SignInRoute:
      return MaterialPageRoute(builder: (context) => SignInPage());
    case ChatroomRoute:
      {
        var argumentUID = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => Chatroom(
                  objectID: argumentUID,
                ));
      }
    case LandingRoute:
      return MaterialPageRoute(builder: (context) => LandingPage());

    // To be implemented below
    case 'Signup':
      return MaterialPageRoute(
          builder: (context) => TwoGeeksSignUpPage());
    case HomeRoute:
      return MaterialPageRoute(builder: (context) => HomePage());
    case TwoGeeksSignInRoute:
      return MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => TwoGeeksSignInPage());
    case MatchingHandlerRoute:
      return MaterialPageRoute(
          builder: (context) => MatchingHandler());
    case DetailRoute:
      {
        var argumentUID = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => Detail(uid: argumentUID));
      }
    case ChatRoute:
      return MaterialPageRoute(builder: (context) => Chat());
    case SettingRoute:
      return MaterialPageRoute(builder: (context) => Settings());

    case UserProfileRoute:
      return MaterialPageRoute(builder: (context) => UserProfile());

    default:
      return MaterialPageRoute(
          builder: (context) => Undefined(name: settings.name));
  }
}
