import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../constants/app_size.dart';
import '../theme/app_text_style.dart';

class OtpInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final int length;
  final bool autofocus;
  final ValueChanged<String>? onCompleted;

  const OtpInput({
    super.key,
    required this.label,
    required this.controller,
    this.length = AppConstants.otpLength,
    this.autofocus = false,
    this.onCompleted,
  });

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_refresh);
    _focusNode.addListener(_refresh);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_refresh);
    _focusNode.removeListener(_refresh);
    _focusNode.dispose();
    super.dispose();
  }

  void _refresh() {
    if (!mounted) return;
    setState(() {});
    if (widget.controller.text.length == widget.length) {
      widget.onCompleted?.call(widget.controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = widget.controller.text;
    final activeIndex = text.length.clamp(0, widget.length - 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: AppSizes.md),
        Directionality(
          textDirection: TextDirection.ltr,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _focusNode.requestFocus,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < widget.length; i++) ...[
                      if (i > 0) const SizedBox(width: AppSizes.sm),
                      _OtpBox(
                        character: i < text.length ? text[i] : '',
                        focused: _focusNode.hasFocus && i == activeIndex,
                      ),
                    ],
                  ],
                ),
                Positioned.fill(
                  child: Opacity(
                    opacity: 0,
                    child: TextField(
                      controller: widget.controller,
                      focusNode: _focusNode,
                      autofocus: widget.autofocus,
                      keyboardType: TextInputType.number,
                      enableInteractiveSelection: false,
                      showCursor: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(widget.length),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _OtpBox extends StatelessWidget {
  final String character;
  final bool focused;

  const _OtpBox({required this.character, required this.focused});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.otpWidth,
      height: AppSizes.otpHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusField),
        border: Border.all(
          color: focused ? AppColors.primary : AppColors.border,
          width: focused ? 1.5 : 1,
        ),
      ),
      child: Text(
        character,
        style: AppTextStyles.titleMedium.copyWith(fontSize: 20),
      ),
    );
  }
}