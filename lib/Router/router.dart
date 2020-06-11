import 'package:flutter/material.dart';
import 'package:twoGeeks/app/Undefined/undefined.dart';
import 'package:twoGeeks/app/chat/chat.dart';
import 'package:twoGeeks/app/chatroom/chatroom.dart';
import 'package:twoGeeks/app/detail/detail.dart';
import 'package:twoGeeks/app/homepage/home_page.dart';
import 'package:twoGeeks/app/matching/matchingHandler.dart';
import 'package:twoGeeks/app/sign_in/sign_in_page.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/app/landing.dart';
import 'package:twoGeeks/app/settings/settings.dart';
import 'package:twoGeeks/app/services/auth.dart';
import 'package:twoGeeks/app/sign_in/twogeeks_sign_in.dart';
import 'package:twoGeeks/app/sign_up/sign_up_page.dart';

Auth auth;
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // Add more routes here
    case SignInRoute:
      return MaterialPageRoute(builder: (context) => SignInPage(auth: auth));
    case ChatroomRoute:
      {
        var argumentUID = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => Chatroom(auth: auth, objectID: argumentUID,));
      }
    case LandingRoute:
      return MaterialPageRoute(builder: (context) => LandingPage(auth: auth));

    // To be implemented below
    case 'Signup':
      return MaterialPageRoute(
          builder: (context) => TwoGeeksSignUpPage(auth: auth));
    case HomeRoute:
      return MaterialPageRoute(builder: (context) => HomePage(auth: auth));
    case TwoGeeksSignInRoute:
      return MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => TwoGeeksSignInPage(auth: auth));
    case MatchingHandlerRoute:
      return MaterialPageRoute(
          builder: (context) => MatchingHandler(auth: auth));
    case DetailRoute:
      {
        var argumentUID = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => Detail(uid: argumentUID));
      }
    case ChatRoute:
      return MaterialPageRoute(builder: (context) => Chat(auth: auth));
    case SettingRoute:
      return MaterialPageRoute(builder: (context) => Settings(auth: auth));
    default:
      return MaterialPageRoute(
          builder: (context) => Undefined(name: settings.name));
  }
}
