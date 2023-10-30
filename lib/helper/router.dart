import 'package:go_router/go_router.dart';
import 'package:weget/helper/router_name.dart';
import 'package:weget/ui/car%20rent/home_car_screen.dart';
import 'package:weget/ui/car%20rent/welcome_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/welcome',
  routes: <RouteBase>[
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/homeCar',
      name: homeCar,
      builder: (context, state) => const HomeCarScreen(),
    ),
  ],
);
