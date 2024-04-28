import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads_clone/controllers/auth_controller.dart';
import 'package:threads_clone/services/navigation_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationService());
    return Obx(
      () => Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(
            milliseconds: 200,
          ),
          switchInCurve: Curves.ease,
          switchOutCurve: Curves.easeInOut,
          child: controller.navigationViews
              .elementAt(controller.currentIndex.value),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: controller.currentIndex.value,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          // backgroundColor: Colors.grey,
          height: 80,
          onDestinationSelected: (value) => controller.updateIndex(value),
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.search),
              icon: Icon(Icons.search_outlined),
              label: "Search",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.add),
              icon: Icon(Icons.add_outlined),
              label: "",
            ),
            NavigationDestination(
                selectedIcon: Icon(Icons.notifications),
                icon: Icon(
                  Icons.notifications_outlined,
                ),
                label: "Notifications"),
            NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outline),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
