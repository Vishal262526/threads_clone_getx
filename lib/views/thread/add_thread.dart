import 'package:flutter/material.dart';

class AddThread extends StatefulWidget {
  const AddThread({super.key});

  @override
  State<AddThread> createState() => _AddThreadState();
}

class _AddThreadState extends State<AddThread> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Thread"),
      ),
      body: const Center(
        child: Text(
          "Add Thread Screen",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
