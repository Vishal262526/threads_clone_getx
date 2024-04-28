import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads_clone/controllers/auth_controller.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
              onPressed: () {
                controller.signOut();
              },
              icon: const Icon(
                Icons.logout_outlined,
              ))
        ],
      ),
      body: Obx(
        () => Center(
          child: controller.isLoading.value
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : const Text(
                  "Profile Screen",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
