import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? size;

  const CustomIcon({
    super.key,
    required this.icon,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$icon.svg',
      colorFilter: ColorFilter.mode(color ?? Theme.of(context).primaryColor, BlendMode.srcIn),
      height: size,
    );
  }
}
