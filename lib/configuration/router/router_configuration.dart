import 'package:academic_advice_app/view/home_view.dart';
import 'package:academic_advice_app/view/login_view.dart';
import 'package:academic_advice_app/view/register_view.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeView()),
  GoRoute(path: '/login_view', builder: (context, state) => const LoginView()),
  GoRoute(path: '/register_view', builder: (context, state) => const RegisterView()),
]);
