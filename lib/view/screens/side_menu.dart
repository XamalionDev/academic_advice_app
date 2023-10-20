import 'package:academic_advice_app/controller/auth_controller.dart';
import 'package:academic_advice_app/view/design_functions/menu_items.dart';
import 'package:academic_advice_app/view/screens/presentation_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).padding.top > 35;

    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });

          final menuItem = appMenuItems[value];
          context.push(menuItem.link);
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          const DrawerHeader(child: Text('Header')),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 25, 16, 10),
              child: const Text(
                'Menu lateral',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
          ),
          ...appMenuItems.sublist(0, 2).map((item) =>
              NavigationDrawerDestination(
                  icon: Icon(item.icon), label: Text(item.title))),
          const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10), child: Divider()),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 0, 16, 10),
            child: Text('Otras opciones'),
          ),
          ...appMenuItems.sublist(2).map((item) => NavigationDrawerDestination(
              icon: Icon(item.icon), label: Text(item.title))),
          FilledButton.icon(
              onPressed: (){
                signOut().then((value) => context.pushReplacementNamed(PresentationScreen.routeName));
              },
              icon: const Icon(Icons.logout_outlined), label: const Text('Cerrar sesión')
          ),
          /*const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10), child: Divider())*/
        ]);
  }
}