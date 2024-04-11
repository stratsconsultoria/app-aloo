import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../../domain/entities/requisitions/requisitions.dart';

class MessageBox extends StatelessWidget {
  final ObservationsEntity observation;
  const MessageBox({
    required this.observation,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HtmlWidget(
            observation.mensagem,
          ),
          const SizedBox(height: 8),
          Text(
            '${observation.usuario} em ${observation.datahora}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
        ],
      ),
    );
  }
}
