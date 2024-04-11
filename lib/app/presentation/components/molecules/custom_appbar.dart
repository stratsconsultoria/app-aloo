import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_routes.dart';

class CustomAppBar extends StatelessWidget {
  final String userName;
  final Widget funcWidget;
  final bool leading;

  const CustomAppBar({
    super.key,
    required this.userName,
    required this.funcWidget,
    this.leading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32, left: 32, top: 60),
      child: Column(
        children: [
          Row(
            children: [
              Visibility(
                visible: !leading,
                replacement: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 40,
                  ),
                ),
                child: InkWell(
                  onTap: () => Get.toNamed(Routes.profile),
                  child: const Icon(
                    Icons.account_circle_outlined,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Olá, seja bem-vindo $userName',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              Image.asset(
                'assets/logo/icon.png',
                height: 32,
              ),
            ],
          ),
          const Spacer(),
          funcWidget,
        ],
      ),
    );
  }
}
