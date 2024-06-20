import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../../../core/shared/utils/utils.dart';
import '../../../domain/entities/entities.dart';

class AlertBox extends StatelessWidget {
  final AlertEntity alert;

  const AlertBox({
    required this.alert,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: Theme.of(context).cardColor,
          ),
        ),
      ),
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HtmlWidget(
                  alert.aviso,
                ),
                const SizedBox(height: 8),
                Text(
                  formattedDate(alert.dataAdd),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
              ],
            ),
          ),
          const Icon(Icons.keyboard_arrow_down_sharp)
        ],
      ),
    );
  }
}
