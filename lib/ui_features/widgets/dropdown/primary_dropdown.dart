import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:magic_power_sales/config/config.dart';

class PrimaryDropdown<T> extends StatelessWidget {
  const PrimaryDropdown({
    super.key,
    this.items = const [],
    this.onTap,
    this.color,
    this.errorText,
    this.expands,
    this.focusColor,
    this.helperText,
    this.label,
    this.hintText = "",
    this.isRaw = false,
    this.keyboardType,
    this.suffix,
    this.suffixIcon,
    this.unFocusColor,
    this.fontSize,
    this.validator,
    this.value,
    this.errorBorder,
    this.inputBorder,
  });
  final List<DropdownMenuItem<T>>? items;
  final Function(T?)? onTap;
  final String hintText;
  final bool? expands;
  final bool isRaw;
  final TextInputType? keyboardType;
  final String? Function(T?)? validator;
  final String? errorText;
  final Widget? suffixIcon, suffix;
  final Color? color, focusColor, unFocusColor;
  final String? helperText, label;
  final T? value;
  final double? fontSize;
  final InputBorder? inputBorder, errorBorder;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T?>(
      icon: SvgPicture.asset(Assets.chevronDown),
      dropdownColor: Colors.white,
      hint: Text(
        hintText,
        style: StyleAsset.paragraph2SemiBold.copyWith(
          fontSize: fontSize ?? screenHeight(context) / 62.4,
          color: ColorAsset.neutral60,
        ),
      ),
      value: value,
      validator: validator ??
          (value) {
            if (value == null || value == "") {
              return '${toBeginningOfSentenceCase(label)} tidak boleh kosong!';
            }
            return null;
          },
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffix: suffix,
        fillColor: color ?? Colors.transparent,
        filled: color != null,
        isDense: true,
        hintStyle: StyleAsset.paragraph2SemiBold.copyWith(
          fontSize: fontSize ?? screenHeight(context) / 62.4,
          color: ColorAsset.neutral60,
        ),
        errorStyle: StyleAsset.paragraph2SemiBold.copyWith(
          color: ColorAsset.error,
        ),
        errorText: errorText,
        helperStyle: StyleAsset.paragraph2SemiBold.copyWith(
          fontSize: screenHeight(context) / 78,
          fontWeight: FontWeight.w400,
        ),
        helperText: helperText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: focusColor ?? ColorAsset.white,
            width: 1.5,
          ),
        ),
        border: inputBorder ??
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
                color: ColorAsset.neutral60,
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
      style: StyleAsset.heading1SemiBold.copyWith(
        color: Colors.black,
        fontSize: fontSize ?? screenHeight(context) / 62.4,
      ),
      items: [
        ...items ?? [],
      ],
      onChanged: onTap,
    );
  }
}
