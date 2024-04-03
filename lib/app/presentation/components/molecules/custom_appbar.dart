import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String userName;
  final Widget funcWidget;

  const CustomAppBar({super.key, required this.userName, required this.funcWidget});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
