import 'package:events_app/utils/screen_arguments.dart';
import 'package:events_app/views/pages/home_screen.dart';
import 'package:events_app/views/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluro/fluro.dart';

import '../views/pages/events/main_detail_event_screen.dart';

class RouterHandler {

  static Handler splashHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          SplashScreen()
  );

  static Handler homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          HomeScreen()
  );

  static Handler eventDetailHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        final args =
        ModalRoute.of(context!)!.settings.arguments as EventDetailArgumet;
        return MainDetailEventScreen(eventModel: args.eventModel);
      });
}