import 'package:academic_advice_app/controller/test_controller.dart';
import 'package:academic_advice_app/view/home_view.dart';
import 'package:academic_advice_app/view/login_view.dart';
import 'package:academic_advice_app/view/register_view.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(
    initialLocation: '/login_view',
    routes: [
      GoRoute(
          path: '/home_view', builder: (context, state) => const HomeView()),
      GoRoute(
          path: '/login_view', builder: (context, state) => const LoginView()),
      GoRoute(
          path: '/register_view',
          builder: (context, state) => const RegisterView()),
    ],
    redirect: (context, state) async {
      return await getUser() ? '/home_view' : '/login_view';
    });
