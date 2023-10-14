import 'package:academic_advice_app/controller/auth_controller.dart';
import 'package:academic_advice_app/view/screens/home_screen.dart';
import 'package:academic_advice_app/view/screens/presentation_screen.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(
    initialLocation: '/presentation_screen',
    routes: [
      GoRoute(
          path: '/home_screen',
          name: HomeScreen.routeName,
          builder: (context, state) => const HomeScreen()),
      GoRoute(
          path: '/presentation_screen',
          name: PresentationScreen.routeName,
          builder: (context, state) => const PresentationScreen()),
      /*GoRoute(
          path: '/register_screen',
          name: RegisterScreen.routeName,
          builder: (context, state) => const RegisterScreen()),*/
    ],
    redirect: (context, state) async {
      return await getUser() ? '/home_screen' : '/presentation_screen';
    });
