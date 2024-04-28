import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:threads_clone/controllers/auth_controller.dart';
import 'package:threads_clone/routes/route_names.dart';
import 'package:threads_clone/routes/routes.dart';
import 'package:threads_clone/widgets/auth_input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _foromkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthController controller = Get.put(AuthController());

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void onSubmit() {
    if (_foromkey.currentState!.validate()) {
      controller.login(
          email: _emailController.text, password: _passwordController.text);
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
                        "Login",
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
                        "Welcome Back",
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
                    height: 24,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: onSubmit,
                        child: Text(controller.isLoading.value
                            ? "Processing..."
                            : "Log In"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: "Sign Up",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(RouteName.register),
                      )
                    ], text: "Don't have an account? "),
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
