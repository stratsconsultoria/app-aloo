import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Center(
                child: Image(
                  image: AssetImage(
                    "assets/logo/logo.png",
                  ),
                  height: 60,
                ),
              ),
              const SizedBox(height: 62),
              Text(
                'Bem-vindo!',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                    ),
              ),
              Text(
                'Entre com seus dados.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              const SizedBox(height: 32.0),
              CustomTextField(
                controller: controller.emailController.value,
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              Obx(
                () => CustomTextField(
                  controller: controller.passwordController.value,
                  obscureText: controller.passwordIsVisible.isFalse,
                  label: 'Senha',
                  suffixIcon: InkWell(
                    onTap: () => controller.passwordIsVisible.toggle(),
                    child: Visibility(
                      visible: controller.passwordIsVisible.value,
                      replacement: const CustomIcon(
                        icon: "eye_slash",
                        size: 24,
                      ),
                      child: const CustomIcon(
                        icon: "eye",
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48.0),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: CustomButtom(
                    label: 'Login',
                    onTap: controller.login,
                  ),
                ),
              ),
              const SizedBox(height: 48.0),
              Text(
                'Esqueceu sua senha? Clique aqui e cadastre-se.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
