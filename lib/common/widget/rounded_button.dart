import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_font_sizes.dart';

class RoundedButton extends StatefulWidget {
  final String text;
  final double btnHeight;
  final double btnWidth;
  final Color? btnColor;
  final Color? txtColor;
  final Icon? leadingIcon;
  final Icon? trailingIcon;

  final VoidCallback onClicked;
  const RoundedButton({
    Key? key,
    required this.text,
    this.btnColor,
    required this.onClicked,
    required this.btnHeight,
    required this.btnWidth,
    this.txtColor,
    this.leadingIcon,
    this.trailingIcon,
  }) : super(key: key);
  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClicked,
      child: SizedBox(
        height: widget.btnHeight,
        width: widget.btnWidth,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: widget.btnColor ?? AppColors.greenColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.leadingIcon ?? const SizedBox(),
              Text(
                '  ${widget.text}  ',
                style: TextStyle(
                  color: widget.txtColor ?? AppColors.whiteColor,
                  fontSize: AppFontSize.small,
                  fontWeight: FontWeight.w600,
                ),
              ),
              widget.trailingIcon ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
