import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magic_power_sales/config/config.dart';

class TextFieldPrimary extends StatelessWidget {
  const TextFieldPrimary({
    super.key,
    this.label,
    this.controller,
    this.hintText,
    this.expands,
    this.keyboardType,
    this.validator,
    this.onEditingComplete,
    this.onChanged,
    this.errorText,
    this.helperText,
    this.isPassword = false,
    this.inputBorder,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.textAlign = TextAlign.start,
    this.initialValue,
    this.errorBorder,
    this.height,
    this.width,
    this.labelColor,
    this.inputFormater,
    this.fontSize,
  });

  final String? label;
  final TextEditingController? controller;
  final String? hintText;
  final bool? expands;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function()? onEditingComplete;
  final Function(String?)? onChanged;
  final String? errorText;
  final String? helperText;
  final bool isPassword;
  final InputBorder? inputBorder, errorBorder;
  final EdgeInsetsGeometry contentPadding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final TextAlign textAlign;
  final String? initialValue;
  final double? height;
  final double? width;
  final Color? labelColor;
  final List<TextInputFormatter>? inputFormater;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    bool isShow = true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: StyleAsset.captionSemiBold.copyWith(
              fontSize: screenHeight(context) / 62.4,
              color: labelColor,
            ),
          ),
          verticalSpace(8)
        ],
        StatefulBuilder(builder: (context, innerState) {
          return SizedBox(
            width: width,
            height: expands ?? false ? 150 : height,
            child: TextFormField(
              initialValue: initialValue,
              readOnly: onTap != null,
              obscureText: isPassword ? isShow : false,
              controller: controller,
              keyboardType: keyboardType,
              expands: expands ?? false,
              minLines: expands == true ? null : 1,
              maxLines: expands == true ? null : 1,
              textInputAction: expands ?? false
                  ? TextInputAction.newline
                  : TextInputAction.done,
              inputFormatters: inputFormater,
              textAlignVertical: TextAlignVertical.top,
              style: StyleAsset.heading1SemiBold.copyWith(
                color: Colors.black,
                fontSize: fontSize ?? screenHeight(context) / 62.4,
              ),
              validator: validator,
              onChanged: onChanged,
              onEditingComplete: () {
                if (onEditingComplete != null) onEditingComplete!();
                FocusScope.of(context).unfocus();
              },
              onTap: onTap,
              textAlign: textAlign,
              decoration: InputDecoration(
                contentPadding: contentPadding,
                fillColor: ColorAsset.white,
                filled: true,
                hintText: hintText,
                error: errorText == null
                    ? null
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 0),
                        child: Text(
                          "$errorText",
                          style: StyleAsset.paragraph2SemiBold.copyWith(
                            fontSize: screenHeight(context) / 78,
                            fontWeight: FontWeight.w400,
                            color: ColorAsset.error30,
                          ),
                        ),
                      ),
                hintStyle: StyleAsset.paragraph2SemiBold.copyWith(
                  fontSize: fontSize ?? screenHeight(context) / 62.4,
                  color: ColorAsset.grey,
                ),
                // errorStyle: AssetStyles.textXLRegular.copyWith(
                //   fontSize: screenHeight(context) / 78,
                //   fontWeight: FontWeight.w400,
                //   color: AssetColors.errorColor,
                // ),
                // errorText: errorText,
                helperStyle: StyleAsset.paragraph2SemiBold.copyWith(
                  fontSize: screenHeight(context) / 78,
                  fontWeight: FontWeight.w400,
                ),
                prefixIconConstraints: const BoxConstraints(maxHeight: 24),
                suffixIconConstraints: const BoxConstraints(maxHeight: 24),
                prefixIcon: prefixIcon,
                suffixIcon: isPassword
                    ? IconButton(
                        onPressed: () {
                          isShow = !isShow;
                          innerState(() {});
                        },
                        icon: Icon(
                          isShow ? Icons.visibility : Icons.visibility_off,
                          color: ColorAsset.grey,
                        ),
                      )
                    : suffixIcon,
                helperText: helperText,
                border: inputBorder ??
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: ColorAsset.grey,
                      ),
                    ),
                focusedBorder: inputBorder ??
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: ColorAsset.neutral60,
                      ),
                    ),
                enabledBorder: inputBorder ??
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: ColorAsset.grey,
                      ),
                    ),
                errorBorder: errorBorder ??
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: ColorAsset.error30,
                      ),
                    ),
              ),
            ),
          );
        }),
        verticalSpace(10),
      ],
    );
  }
}
