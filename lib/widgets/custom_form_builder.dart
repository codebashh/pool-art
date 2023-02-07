import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:poolart/configs/configs.dart';

class CustomTextField extends StatefulWidget {
  final String name;
  final String? hint;
  final bool? isPass;
  final bool? enabled;
  final double? width;
  final int? maxlines;
  final bool? autoFocus;
  final FocusNode? node;

  final Widget? prefixIcon;
  final bool? isSuffixIcon;
  final String? initialValue;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;

  final String? errorText;
  final String? Function(String?)? validatorFtn;
  final String? Function(String?)? onChangeFtn;

  const CustomTextField(
      {Key? key,
      this.node,
      this.enabled,
      this.errorText,
      this.autoFocus,
      this.prefixIcon,
      this.onChangeFtn,
      this.initialValue,
      this.validatorFtn,
      required this.name,
      required this.hint,
      this.isPass = false,
      this.textCapitalization = TextCapitalization.none,
      this.isSuffixIcon = false,
      required this.textInputType,
      this.width = double.infinity,
      this.textInputAction = TextInputAction.done,
      this.maxlines = 1})
      : super(key: key);

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool show = false;

  @override
  void initState() {
    show = widget.isPass!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      maxLines: widget.maxlines,
      textCapitalization: widget.textCapitalization,
      enabled: widget.enabled ?? true,
      initialValue: widget.initialValue,
      name: widget.name,
      autofocus: widget.autoFocus ?? false,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      focusNode: widget.node,
      obscureText: show,
      decoration: InputDecoration(
        errorText: widget.errorText,
        prefixIcon: widget.isSuffixIcon! ? null : widget.prefixIcon,
        suffixIcon: widget.isPass!
            ? IconButton(
                splashRadius: AppDimensions.normalize(8),
                onPressed: () {
                  setState(() {
                    show = !show;
                  });
                },
                icon: Icon(
                  show ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                  size: AppDimensions.normalize(7),
                ),
              )
            : null,
        filled: true,
        contentPadding: Space.all(0.75, 0.9),
        hintText: widget.hint,
        hintStyle: AppText.l1!.copyWith(
          color: AppTheme.c!.textSub2,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(111, 111, 111, 0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.c!.primary!,
            width: AppDimensions.normalize(0.75),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.red.withAlpha(200),
            width: AppDimensions.normalize(0.75),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.red.withAlpha(200),
            width: AppDimensions.normalize(0.75),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            width: AppDimensions.normalize(0.75),
            color: Colors.transparent,
          ),
        ),
      ),
      validator: widget.validatorFtn,
      onChanged: widget.onChangeFtn,
    );
  }
}
