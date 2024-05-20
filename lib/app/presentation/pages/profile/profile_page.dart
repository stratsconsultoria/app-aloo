import 'package:app_aloo/app/presentation/components/atoms/atoms.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: const Text('MEU PERFIL'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'Olá, ${controller.authController.account.value.nome}!',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            const Divider(
              thickness: 0.25,
              height: 0.2,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Nome',
              controller: controller.nameController.value,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'E-mail',
              controller: controller.emailController.value,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Celular',
              controller: controller.phoneController.value,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            const SizedBox(height: 32),
            const Divider(
              thickness: 0.25,
              height: 0.2,
              color: Colors.grey,
            ),
            const SizedBox(height: 32),
            CustomTextField(
              label: 'Senha',
              controller: controller.phoneController.value,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Confirme sua senha',
              controller: controller.phoneController.value,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            const SizedBox(height: 32),
            CustomButtom(
              label: 'Salvar',
              onTap: () => {},
            ),
            const SizedBox(height: 16),
            CustomButtom(
              label: 'Sair do app',
              type: 'delete',
              onTap: () => controller.authController.logout(),
            ),
          ],
        ),
      ),
    );
  }
}
