import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget? icon;
  final Widget? sufixIon;

  const CustomListTile({
    required this.title,
    required this.subTitle,
    this.icon,
    this.sufixIon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon ?? const SizedBox(),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    height: 0.8,
                  ),
            ),
          ],
        ),
        const Spacer(),
        sufixIon ?? const SizedBox(),
      ],
    );
  }
}
