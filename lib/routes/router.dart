import 'package:events_app/routes/router_handler.dart';
import 'package:fluro/fluro.dart';

class RouterApp {

  static FluroRouter router = FluroRouter();

  static void setupRouter() {
    router.define(
        '/',
        handler: RouterHandler.splashHandler,
        transitionType: TransitionType.fadeIn
    );

    router.define(
        '/home',
        handler: RouterHandler.homeHandler,
        transitionType: TransitionType.inFromRight
    );

    router.define(
        '/detail',
        handler: RouterHandler.eventDetailHandler,
        transitionType: TransitionType.inFromRight
    );
  }
}