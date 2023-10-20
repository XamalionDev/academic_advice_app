import 'package:flutter/material.dart';

class MenuItem{
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Perfil',
      subtitle: 'Ver perfil de usuario',
      link: '/profile_screen',
      icon: Icons.account_circle_outlined
  ),
  MenuItem(
    title: 'Configuración',
    subtitle: 'Configuración de la aplicación',
    link: '/configuration_screen',
    icon: Icons.settings
  ),
  MenuItem(
      title: 'Asesorías',
      subtitle: 'Ir a las asesorías',
      link: '/advice_screen',
      icon: Icons.access_time_outlined
  ),

];