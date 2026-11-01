import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';

enum CustomButtonType { filled, outlined, danger }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final CustomButtonType type;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool isLoading;
  final double? width;
  final double height;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = CustomButtonType.filled,
    this.backgroundColor,
    this.foregroundColor,
    this.isLoading = false,
    this.width,
    this.height = AppSizes.buttonHeight,
  });

  @override
  Widget build(BuildContext context) {
    final VoidCallback? action = isLoading ? null : onPressed;

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: switch (type) {
        CustomButtonType.filled => ElevatedButton(
          onPressed: action,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            disabledBackgroundColor:
            (backgroundColor ?? AppColors.primary).withValues(alpha: 0.6),
            disabledForegroundColor:
            (foregroundColor ?? Colors.white).withValues(alpha: 0.9),
            minimumSize: Size(0, height),
          ),
          child: _content(foregroundColor ?? Colors.white),
        ),
        CustomButtonType.outlined => OutlinedButton(
          onPressed: action,
          style: OutlinedButton.styleFrom(
            foregroundColor: foregroundColor,
            minimumSize: Size(0, height),
          ),
          child: _content(foregroundColor ?? AppColors.primary),
        ),
        CustomButtonType.danger => OutlinedButton(
          onPressed: action,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.error,
            side: const BorderSide(color: AppColors.error),
            minimumSize: Size(0, height),
          ),
          child: _content(AppColors.error),
        ),
      },
    );
  }

  Widget _content(Color loaderColor) {
    if (isLoading) {
      return SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(strokeWidth: 2.5, color: loaderColor),
      );
    }
    return Text(text);
  }
}