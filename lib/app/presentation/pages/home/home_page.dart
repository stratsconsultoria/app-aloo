import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(right: 32, left: 32, top: 60),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.account_circle_outlined,
                    size: 40,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Olá, seja bem-vindo ${controller.authController.account.value.nome}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/logo/icon.png',
                    height: 32,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(),
    );
  }
}
