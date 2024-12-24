import 'package:go_router/go_router.dart';
import 'package:weget/helper/router_name.dart';
import 'package:weget/ui/car%20rent/details_car_screen.dart';
import 'package:weget/ui/car%20rent/home_car_screen.dart';
import 'package:weget/ui/form/form1.dart';
import 'package:weget/ui/form/form2.dart';
import 'package:weget/ui/form/form3.dart';
import 'package:weget/ui/socket-io/socket_io_example.dart';

final GoRouter router = GoRouter(
  initialLocation: '/welcome',
  routes: <RouteBase>[
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const SocketIoExample(),
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
    GoRoute(
      path: '/form1',
      name: form1,
      builder: (context, state) => const Form1Page(),
    ),
    GoRoute(
      path: '/form2',
      name: form2,
      builder: (context, state) => Form2Page(),
    ),
    GoRoute(
      path: '/form3',
      name: form3,
      builder: (context, state) => const Form3Page(),
    ),
  ],
);
