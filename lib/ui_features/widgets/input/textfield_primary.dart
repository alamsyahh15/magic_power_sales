import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:magic_power_sales/config/config.dart';

class TextFieldPrimary extends StatefulWidget {
  const TextFieldPrimary({
    super.key,
    this.label,
    this.controller,
    this.hintText,
    this.expands,
    this.keyboardType,
    this.validator,
    this.onEditingComplete,
    this.errorStyle,
    this.onChanged,
    this.errorText,
    this.helperText,
    this.isPassword = false,
    this.inputBorder,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.prefixIcon,
    this.suffixIcon,
    this.labelStyle,
    this.onTap,
    this.textAlign = TextAlign.start,
    this.initialValue,
    this.errorBorder,
    this.height,
    this.isRaw = false,
    this.width,
    this.labelColor,
    this.radius = 8,
    this.inputFormater,
    this.hintStyle,
    this.gapLabel = 8,
    this.fontSize,
  });

  final String? label;
  final TextEditingController? controller;
  final String? hintText;
  final double radius;
  final bool? expands;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function()? onEditingComplete;
  final Function(String?)? onChanged;
  final String? errorText;
  final String? helperText;
  final bool isPassword;
  final bool isRaw;
  final TextStyle? errorStyle, hintStyle, labelStyle;
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
  final double gapLabel;

  @override
  State<TextFieldPrimary> createState() => _TextFieldPrimaryState();
}

class _TextFieldPrimaryState extends State<TextFieldPrimary> {
  bool isShow = true;
  List<Map<String, dynamic>> validator = [
    {
      "name": "Minimal 8 karakter",
      "value": false,
    },
    {
      "name": "Mengandung 1 huruf kecil",
      "value": false,
    },
    {
      "name": "Mengandung 1 huruf besar",
      "value": false,
    },
    {
      "name": "Mengandung 1 angka",
      "value": false,
    },
    {
      "name": "Mengandung 1 karakter spesial",
      "value": false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!widget.isRaw)
          if (widget.label != null) ...[
            Text(
              widget.label!,
              style: widget.labelStyle ??
                  StyleAsset.captionSemiBold.copyWith(
                    fontSize: screenHeight(context) / 62.4,
                    color: widget.labelColor,
                  ),
            ),
            verticalSpace(widget.gapLabel)
          ],
        SizedBox(
          width: widget.width,
          height: widget.expands ?? false ? 150 : widget.height,
          child: TextFormField(
            initialValue: widget.initialValue,
            readOnly: widget.onTap != null,
            obscureText: widget.isPassword ? isShow : false,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            expands: widget.expands ?? false,
            minLines: widget.expands == true ? null : 1,
            maxLines: widget.expands == true ? null : 1,
            textInputAction: widget.expands ?? false
                ? TextInputAction.newline
                : TextInputAction.done,
            inputFormatters: widget.inputFormater,
            textAlignVertical: TextAlignVertical.center,
            style: StyleAsset.heading1SemiBold.copyWith(
              color: Colors.black,
              fontSize: widget.fontSize ?? screenHeight(context) / 62.4,
            ),
            validator: (e) {
              if (isEmpty(e)) {
                return "Kolom ${toBeginningOfSentenceCase(widget.label ?? "")} harus diisi";
              }
              if (widget.isPassword) {
                setState(() {
                  validator.map((val) => val["value"] = false).toList();
                });

                if (!lengthMoreThan(e!)) {
                  validator[0]["value"] = true;
                }

                if (!containLowerCase(e)) {
                  validator[1]["value"] = true;
                }

                if (!containUpperCase(e)) {
                  validator[2]["value"] = true;
                }

                if (!containNumber(e)) {
                  validator[3]["value"] = true;
                }

                if (containSpecialCharacter(e)) {
                  validator[4]["value"] = true;
                }
                if (validator.where((e) => e["value"]).isNotEmpty) {
                  return "";
                }
              }

              if (widget.validator != null) {
                return widget.validator!(e);
              }

              return null;
            },
            onChanged: widget.onChanged,
            onEditingComplete: () {
              if (widget.onEditingComplete != null) widget.onEditingComplete!();
              FocusScope.of(context).unfocus();
            },
            onTap: widget.onTap,
            textAlign: widget.textAlign,
            decoration: InputDecoration(
              contentPadding: widget.contentPadding,
              fillColor: ColorAsset.white,
              filled: true,
              hintText: widget.hintText,
              errorStyle: widget.isPassword
                  ? TextStyle(
                      height: validator.where((e) => e["value"]).isNotEmpty
                          ? -5
                          : 0,
                    )
                  : widget.errorStyle,
              error: widget.errorText == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, top: 0),
                      child: Text(
                        "${widget.errorText}",
                        style: StyleAsset.paragraph2SemiBold.copyWith(
                          fontSize: screenHeight(context) / 78,
                          fontWeight: FontWeight.w400,
                          color: ColorAsset.error30,
                        ),
                      ),
                    ),
              hintStyle: StyleAsset.paragraph2SemiBold.copyWith(
                fontSize: widget.fontSize ?? screenHeight(context) / 62.4,
                color: ColorAsset.neutral60,
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
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isShow = !isShow;
                        });
                      },
                      icon: Icon(
                        isShow ? Icons.visibility : Icons.visibility_off,
                        color: ColorAsset.neutral60,
                      ),
                    )
                  : widget.suffixIcon,
              helperText: widget.helperText,
              border: widget.inputBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius),
                    borderSide: BorderSide(
                      color: ColorAsset.neutral60,
                    ),
                  ),
              focusedBorder: widget.inputBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius),
                    borderSide: BorderSide(
                      color: ColorAsset.grey,
                    ),
                  ),
              enabledBorder: widget.inputBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius),
                    borderSide: BorderSide(
                      color: ColorAsset.neutral60,
                    ),
                  ),
              errorBorder: widget.errorBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius),
                    borderSide: BorderSide(
                      color: ColorAsset.error30,
                    ),
                  ),
            ),
          ),
        ),
        if (widget.isPassword)
          if (validator.where((e) => e["value"]).isNotEmpty)
            for (var row in validator)
              Row(
                children: [
                  Icon(
                    !row["value"] ? Icons.check_rounded : Icons.close_rounded,
                    color: !row["value"]
                        ? ColorAsset.success30
                        : ColorAsset.error30,
                  ),
                  Text(
                    row["name"],
                    style: StyleAsset.paragraph2.copyWith(
                      color: !row["value"]
                          ? ColorAsset.success30
                          : ColorAsset.error30,
                    ),
                  ),
                ],
              ),
        if (!widget.isRaw) verticalSpace(15),
      ],
    );
  }
}
