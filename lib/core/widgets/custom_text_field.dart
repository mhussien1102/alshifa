import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final String? helperText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool isPassword;
  final bool readOnly;
  final bool compact;
  final VoidCallback? onTap;
  final IconData? prefixIcon;
  final Color? fillColor;
  final ValueChanged<String>? onSubmitted;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.helperText,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.isPassword = false,
    this.readOnly = false,
    this.compact = false,
    this.onTap,
    this.prefixIcon,
    this.fillColor,
    this.onSubmitted,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscure = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: AppSizes.sm),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: _obscure,
          readOnly: widget.readOnly,
          showCursor: !widget.readOnly,
          onTap: widget.onTap,
          onFieldSubmitted: widget.onSubmitted,
          decoration: InputDecoration(
            hintText: widget.hint,
            fillColor: widget.fillColor,
            contentPadding: widget.compact
                ? const EdgeInsets.symmetric(
              horizontal: AppSizes.lg,
              vertical: 13,
            )
                : null,
            prefixIcon: widget.prefixIcon == null
                ? null
                : Icon(widget.prefixIcon, size: 22, color: AppColors.primary),
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                _obscure ? LucideIcons.eye : LucideIcons.eyeOff,
                size: 22,
              ),
              onPressed: () => setState(() => _obscure = !_obscure),
            )
                : null,
          ),
        ),
        if (widget.helperText != null)
          Padding(
            padding: const EdgeInsets.only(top: AppSizes.sm),
            child: Text(
              widget.helperText!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 14, height: 1.4),
            ),
          ),
      ],
    );
  }
}