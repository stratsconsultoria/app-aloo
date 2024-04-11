import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget icon;

  const CustomListTile({
    required this.title,
    required this.subTitle,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
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
      ],
    );
  }
}
