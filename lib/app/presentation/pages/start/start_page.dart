import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'start_controller.dart';

class StartPage extends GetView<StartController> {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.screens[controller.selectedScreen.value],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedScreen.value,
          onTap: (index) => controller.setScreen(index),
          selectedIconTheme: const IconThemeData(size: 32),
          backgroundColor: Theme.of(context).colorScheme.primary,
          selectedItemColor: Theme.of(context).colorScheme.onPrimary,
          unselectedItemColor: Theme.of(context).colorScheme.onSecondary,
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.networkWired),
              label: 'Circuitos',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.clipboardList),
              label: 'Chamados',
            ),
          ],
        ),
      ),
    );
  }
}
