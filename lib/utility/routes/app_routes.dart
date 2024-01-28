
import 'dart:developer';

import 'package:flutter_learn_13/login/login_page.dart';
import 'package:flutter_learn_13/login/profile.dart';
import 'package:flutter_learn_13/rxdart/rxdart_example.dart';
import 'package:flutter_learn_13/stream_controller/example.dart';
import 'package:flutter_learn_13/table/table_example.dart';
import 'package:flutter_learn_13/utility/routes/route_names.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../../animate slider/sliderexample.dart';
import '../../circlular_list/circular_page.dart';
import '../../connectivity/connectivity_example.dart';
import '../../home_page.dart';
import '../../login/loginstate.dart';
import '../../notifications/notification_test.dart';
import '../../object_box/objectbox_page.dart';
import '../../overlay_example/overlay.dart';
import '../../third_pary_license.dart';
import '../../url_luncher/url_luncher_example.dart';
import '../../web_view/web_view_example.dart';

class AppRouter{
  final LoginState loginState = LoginState();

  GoRouter returnRouter(bool isAuth){
    GoRouter  router = GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const MyHomePage(title: 'Practice',);
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'urlLauncher',
              name: RoutePathConstants.urlLauncher,
              builder: (BuildContext context, GoRouterState state) {
                return const UrlLuncherExample(title: 'Url Launcher',);
              },
            ),
            GoRoute(
              path: 'webView',
              name: RoutePathConstants.webView,
              builder: (BuildContext context, GoRouterState state) {
                return const WebViewExample();
              },
            ),
            GoRoute(
              path: 'connectivity',
              name: RoutePathConstants.connectivity,
              builder: (BuildContext context, GoRouterState state) {
                return const ConnectivityExample();
              },
            ),
            GoRoute(
              path: 'objectBox',
              name: RoutePathConstants.objectBox,
              builder: (BuildContext context, GoRouterState state) {
                return BoxPage();
              },
            ),

            GoRoute(
              path: 'overlay',
              name: RoutePathConstants.overlay,
              builder: (BuildContext context, GoRouterState state) {
                return const OverlayExample();
              },
            ),
            GoRoute(
              path: 'notification',
              name: RoutePathConstants.notification,
              builder: (BuildContext context, GoRouterState state) {
                return const TryNotify();
              },
            ),

            GoRoute(
              path: 'license',
              builder: (BuildContext context, GoRouterState state) {
                return const PackageDetailsPage();
              },
            ),
            GoRoute(
              path: 'circle',
              name: RoutePathConstants.circlePage,
              builder: (BuildContext context, GoRouterState state) {
                return const CircularPage();
              },
            ),
            GoRoute(
              path: 'stream',
              name: RoutePathConstants.streamPage,
              builder: (BuildContext context, GoRouterState state) {
                return const StreamControllerExample();
              },
            ),
            GoRoute(
              path: 'rxdart',
              name: RoutePathConstants.rxdart,
              builder: (BuildContext context, GoRouterState state) {
                return const RxdartExample();
              },
            ),
            GoRoute(
              path: 'table',
              name: RoutePathConstants.table,
              builder: (BuildContext context, GoRouterState state) {
                return const TableExample();
              },
            ),
            GoRoute(
              path: 'slider',
              name: RoutePathConstants.slider,
              builder: (BuildContext context, GoRouterState state) {
                return const SliderExample();
              },
            ),
            GoRoute(
              path: 'login',
              name: RoutePathConstants.login,
              builder: (BuildContext context, GoRouterState state) {
                return const LoginPage();
              },
              routes: [
                GoRoute(
                  path: 'profile',
                  name: RoutePathConstants.profile,
                  builder: (BuildContext context, GoRouterState state) {
                    return const ProfilePage();
                  },
                ),
              ]
            ),

          ],
        ),
      ],
      redirect: (BuildContext context, GoRouterState state) {
        // if (!isAuth && state.matchedLocation.contains('license')) {
        //   return '/circle';
        // } else {
        //   return null;
        // }

        final loginLoc = state.namedLocation(RoutePathConstants.profile);
        // final bool loggingIn = state.matchedLocation ==(loginLoc) ;
        //
        var loggedIn = loginState.isLoggedIn;
        // if (!loggedIn && !loggingIn) return '/';
        if (loggedIn && state.matchedLocation.contains(RoutePathConstants.profile)){ return loginLoc;}
        else if(!loggedIn && state.matchedLocation.contains(RoutePathConstants.profile)) {return '/';}

        return null;

      },

    );
    return router;
  }

}
