import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:threads_clone/controllers/auth_controller.dart';
import 'package:threads_clone/routes/route_names.dart';
import 'package:threads_clone/utils/helper.dart';
import 'package:threads_clone/widgets/auth_input.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _foromkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final AuthController controller = Get.put(AuthController());

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void onSubmit() {
    // showSnackBar(title: "Success", message: "I am just testing...");
    if (_foromkey.currentState!.validate()) {
      controller.register(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _foromkey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: MediaQuery.of(context).size.width / 5,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Welcome to the threads world",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AuthInput(
                    validatorCallBack:
                        ValidationBuilder().minLength(3).maxLength(15).build(),
                    label: "Name",
                    hintText: "Enter your name",
                    controller: _nameController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AuthInput(
                    validatorCallBack: ValidationBuilder().email().build(),
                    label: "Email",
                    hintText: "Enter your Email",
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AuthInput(
                    validatorCallBack:
                        ValidationBuilder().minLength(8).maxLength(20).build(),
                    label: "Password",
                    hintText: "Enter your Password",
                    controller: _passwordController,
                    isSecureEntry: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AuthInput(
                    validatorCallBack: (value) {
                      if (value != _passwordController.text) {
                        return "Password does not match";
                      }
                      return null;
                    },
                    label: "Confirm Password",
                    hintText: "Re-enter your password",
                    controller: _confirmPasswordController,
                    isSecureEntry: true,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: onSubmit,
                        child: Text(controller.isLoading.value
                            ? "Processing..."
                            : "Create Account"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: "Log In",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                      )
                    ], text: "Already have an account? "),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
