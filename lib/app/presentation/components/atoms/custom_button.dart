import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components.dart';

class CustomButtom extends StatelessWidget {
  final void Function() onTap;
  final String label, type;
  final bool disable;
  final bool small;
  final bool isLoading;
  final String? icon;

  const CustomButtom({
    super.key,
    required this.onTap,
    required this.label,
    this.type = 'confirm',
    this.disable = false,
    this.small = false,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = context.theme.colorScheme.onPrimary;
    switch (type) {
      case 'confirm':
        break;
      case 'seccond':
        backgroundColor = Colors.transparent;
        break;
      case 'delete':
        backgroundColor = context.theme.colorScheme.error;
        break;
      default:
        throw Exception('Invalid type. Only "confirm" or "cancel" are allowed.');
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(Get.width, small ? 36 : 54),
        backgroundColor: backgroundColor,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: type == "seccond"
            ? BorderSide(
                width: 1,
                color: context.theme.primaryColor,
              )
            : null,
      ),
      onPressed: disable ? null : onTap,
      child: Visibility(
        visible: !isLoading,
        replacement: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: icon != null,
              child: CustomIcon(
                icon: icon ?? '',
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: type != 'confirm'
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).scaffoldBackgroundColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}