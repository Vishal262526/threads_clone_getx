import 'package:get/get.dart';
import 'package:threads_clone/routes/route_names.dart';
import 'package:threads_clone/views/auth/login.dart';
import 'package:threads_clone/views/auth/register.dart';
import 'package:threads_clone/views/home.dart';

class Routes {
  static final pages = [
    GetPage(name: RouteName.home, page: () => const Home()),
    GetPage(
      name: RouteName.login,
      page: () => const Login(),
    ),
    GetPage(
      name: RouteName.register,
      page: () => const Register(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RouteName.home,
      page: () => const Home(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
  ];
}
