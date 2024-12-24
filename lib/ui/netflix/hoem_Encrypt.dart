import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return AppScaffold(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
            path: '/home',
            builder: (BuildContext context, GoRouterState state) {
              return Column(
                children: [
                  const Center(child: Text('Home')),
                  ElevatedButton(
                      onPressed: () {
                        context.go('/home/test');
                      },
                      child: const Text('ke tes'))
                ],
              );
            },
            routes: [
              GoRoute(
                path: 'test',
                builder: (BuildContext context, GoRouterState state) {
                  return const Center(child: Text('testt'));
                },
              ),
            ]),
        GoRoute(
          path: '/search',
          builder: (BuildContext context, GoRouterState state) {
            return const Center(child: Text('Search'));
          },
        ),
        GoRoute(
          path: '/account',
          builder: (BuildContext context, GoRouterState state) {
            return const Center(child: Text('Account'));
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

class AppScaffold extends StatefulWidget {
  const AppScaffold({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo App')),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Account'),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).fullPath;
    log("Current location: $location");

    if (location!.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/search')) {
      return 1;
    }
    if (location.startsWith('/account')) {
      return 2;
    }
    return 0;
  }

  void onTap(int value) {
    switch (value) {
      case 0:
        return context.go('/home');
      case 1:
        return context.go('/search');
      case 2:
        return context.go('/account');
      default:
        return context.go('/home');
    }
  }
}
