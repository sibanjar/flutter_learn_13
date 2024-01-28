import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_13/animate%20slider/animatedslider.dart';
import 'package:flutter_learn_13/utility/routes/route_names.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'login/login_page.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key,required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: ()=>context.pushNamed(RoutePathConstants.urlLauncher),
              child: const Text('URL Launcher'),
            ),
            ElevatedButton(
              onPressed: ()=>context.pushNamed(RoutePathConstants.webView),
              child: const Text('Web View'),
            ),
            ElevatedButton(
              onPressed: ()=>context.pushNamed(RoutePathConstants.connectivity),
              child: const Text('connectivity example'),
            ),
            ElevatedButton(
              onPressed: ()=>context.pushNamed(RoutePathConstants.objectBox),
              child: const Text('object box example'),
            ),
            ElevatedButton(
              onPressed: ()=>context.pushNamed(RoutePathConstants.overlay),
              child: const Text('overlay Example'),
            ),
            ElevatedButton(
              onPressed: ()=>context.pushNamed(RoutePathConstants.circlePage),
              child: const Text('circular list'),
            ),
            ElevatedButton(
              onPressed: ()=>context.pushNamed(RoutePathConstants.streamPage),
              child: const Text('stream Controller'),
            ),
            ElevatedButton(
              onPressed: ()=>context.pushNamed(RoutePathConstants.notification),
              child: const Text('Notification test'),
            ),
            ElevatedButton(
              onPressed: ()=>context.pushNamed(RoutePathConstants.rxdart),
              child: const Text('rxdart'),
            ),
            ElevatedButton(
              onPressed: ()=>context.pushNamed(RoutePathConstants.table),
              child: const Text('Tables'),
            ),
            ElevatedButton(
              onPressed: ()=>context.pushNamed(RoutePathConstants.slider),
              child: const Text('slider'),
            ),
            ElevatedButton(
              onPressed: ()=>context.pushNamed(RoutePathConstants.login,extra: ''),
              child: const Text('login page'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/license'),
              child: const Text('License'),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const SliderExample(),
      LoginPage(),
      Container(),
      // SettingsScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        // routeAndNavigatorSettings: RouteAndNavigatorSettings(
        //   initialRoute: "/",
        //   routes: {
        //     "/login": (final context) => const LoginPage(),
        //   },
        // ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.location),
        title: ("Login"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
