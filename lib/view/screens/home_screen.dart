import 'package:academic_advice_app/controller/auth_controller.dart';
import 'package:academic_advice_app/view/screens/presentation_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home View'),
            FilledButton(
                onPressed: (){
                  signOut().then((value) => context.pushReplacementNamed(PresentationScreen.routeName));
                },
                child: const Text('Cerrar sesión'))
          ],
        )
      ),
    );
  }
}
