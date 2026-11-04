import 'package:flutter/material.dart';

import '../constants/app_size.dart';
import '../theme/app_text_style.dart';

class TextLinkRow extends StatelessWidget {
  final String text;
  final String linkText;
  final VoidCallback onPressed;

  const TextLinkRow({
    super.key,
    required this.text,
    required this.linkText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
        ),
        const SizedBox(width: AppSizes.xs),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            textStyle: AppTextStyles.link.copyWith(fontSize: 16),
          ),
          child: Text(linkText),
        ),
      ],
    );
  }
}