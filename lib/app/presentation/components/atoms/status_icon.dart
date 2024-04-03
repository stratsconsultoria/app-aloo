import 'package:flutter/material.dart';

class StatusIcon extends StatelessWidget {
  final String status;
  const StatusIcon({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case 'atual':
        return const Icon(
          Icons.circle,
          color: Colors.green,
        );
      default:
        return const Icon(
          Icons.circle,
          color: Colors.red,
        );
    }
  }
}
