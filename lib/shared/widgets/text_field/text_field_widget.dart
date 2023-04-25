import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/utils.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String? title;
  final String? hint;
  final bool expands;
  final int? maxLines;
  final Color? containerColor;
  final Color? iconColor;
  final IconData? icon;
  final TextAlign? align;
  final TextInputType inputType;
  final bool isPassword;
  final double opacity;
  final Color? textColor;
  final Function? onChanged;
  final double fontSize;
  final bool readOnly;
  final double hMargin;
  final double vMargin;
  final FormFieldValidator<String>? validator;
  final bool shadow;
  final double? width;
  final Color? fillColor;
  final Color? borderColor;
  final double? height;
  final bool useDefaultHeight;
  final List<TextInputFormatter> inputFormatters;
  final VoidCallback? onTap;
  final int? maxLength;
  final double borderRadius;
  const TextFieldWidget({
    super.key,
    required this.controller,
    this.title,
    this.hint,
    this.maxLines,
    this.expands = false,
    this.icon,
    this.align,
    this.inputType = TextInputType.text,
    this.isPassword = false,
    this.opacity = 1,
    this.containerColor,
    this.iconColor,
    this.textColor,
    this.onChanged,
    this.fontSize = 14,
    this.readOnly = false,
    this.hMargin = 0,
    this.vMargin = 0,
    this.validator,
    this.shadow = true,
    this.width,
    this.height = 60,
    this.fillColor,
    this.borderColor,
    this.inputFormatters = const [],
    this.onTap,
    this.maxLength,
    this.useDefaultHeight = true,
    this.borderRadius = 4,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isVisible = false;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    void onChanged(String value) {
      if (widget.onChanged != null) widget.onChanged!(value);
    }

    void toggle() {
      setState(() {
        isVisible = !isVisible;
      });
    }

    return Container(
      // padding: EdgeInsets.zero,
      margin: EdgeInsets.symmetric(
        horizontal: widget.hMargin,
        vertical: widget.vMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.borderRadius)),
              color: widget.containerColor != null
                  ? widget.containerColor!.withOpacity(widget.opacity)
                  : context.theme.colorScheme.background
                      .withOpacity(widget.opacity),
              boxShadow: widget.shadow
                  ? [
                      const BoxShadow(
                        blurRadius: 5.0,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      ),
                    ]
                  : [],
            ),
            height: widget.useDefaultHeight ? widget.height : null,
            width: widget.width ?? context.querySize.width,
            child: Center(
              child: TextFormField(
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.start,
                keyboardType: widget.inputType,
                obscureText: widget.isPassword ? !isVisible : isVisible,
                readOnly: widget.readOnly,
                controller: widget.controller,
                cursorColor: widget.textColor ??
                    context.theme.textTheme.bodyLarge!.color,
                expands: widget.expands,
                maxLines: widget.expands ? null : widget.maxLines,
                style: widget.textColor != null
                    ? TextStyle(
                        color: widget.textColor,
                        fontSize: widget.fontSize,
                      )
                    : TextStyle(
                        color: context.theme.textTheme.bodyLarge!.color,
                        fontSize: widget.fontSize,
                      ),
                onChanged: (String value) => onChanged(value),
                inputFormatters: widget.inputFormatters,
                validator: widget.validator != null
                    ? (String? value) {
                        final error = widget.validator!(value);

                        setState(() {
                          errorText = error;
                        });

                        if (error != null) {
                          return error;
                        }

                        return null;
                      }
                    : null,
                onTap: widget.onTap,
                maxLength: widget.maxLength,
                decoration: InputDecoration(
                  counterStyle: TextStyle(
                    color: context.theme.textTheme.bodyMedium!.color,
                    fontSize: widget.fontSize,
                  ),
                  alignLabelWithHint: true,
                  fillColor:
                      widget.fillColor ?? context.theme.colorScheme.background,
                  hoverColor:
                      widget.fillColor ?? context.theme.colorScheme.background,
                  focusColor:
                      widget.fillColor ?? context.theme.colorScheme.background,
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          icon: Icon(
                            isVisible ? Icons.visibility : Icons.visibility_off,
                            color: widget.iconColor ??
                                context.theme.textTheme.bodyLarge!.color,
                          ),
                          onPressed: toggle,
                        )
                      : widget.icon != null
                          ? Icon(widget.icon, color: widget.iconColor)
                          : null,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                    gapPadding: 0,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF12AF7C),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                    gapPadding: 0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 0,
                    borderSide: BorderSide(
                      color: widget.borderColor ??
                          context.theme.textTheme.bodyLarge!.color!,
                      width: 0.5,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  errorText: null,
                  errorStyle: const TextStyle(fontSize: 0),
                  errorBorder: const OutlineInputBorder(
                    gapPadding: 0,
                    borderSide: BorderSide(
                      color: Color(0xFFE21723),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE21723),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                    gapPadding: 0,
                  ),
                  labelText: widget.title,
                  hintText: widget.hint,
                  labelStyle: widget.textColor != null
                      ? TextStyle(
                          color: widget.textColor,
                          fontSize: widget.fontSize,
                        )
                      : context.theme.textTheme.bodyLarge!.copyWith(
                          fontSize: widget.fontSize,
                        ),
                  hintStyle: widget.textColor != null
                      ? TextStyle(
                          color: widget.textColor,
                          fontSize: widget.fontSize,
                        )
                      : context.theme.textTheme.bodyLarge!.copyWith(
                          fontSize: widget.fontSize,
                        ),
                ),
              ),
            ),
          ),
          errorText != null
              ? Container(
                  width: widget.width,
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    errorText!,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
