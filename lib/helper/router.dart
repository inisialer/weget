import 'package:go_router/go_router.dart';
import 'package:weget/helper/router_name.dart';
import 'package:weget/mobile_number.dart';
import 'package:weget/ui/car%20rent/details_car_screen.dart';
import 'package:weget/ui/car%20rent/home_car_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/welcome',
  routes: <RouteBase>[
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const MobileNumberScreen(),
    ),
    GoRoute(
      path: '/homeCar',
      name: homeCar,
      builder: (context, state) => const HomeCarScreen(),
    ),
    GoRoute(
      path: '/detailCar',
      name: detailCar,
      builder: (context, state) => const DetailsCarScreen(),
    ),
  ],
);
