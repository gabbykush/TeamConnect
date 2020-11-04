import 'package:flutter/material.dart';
import 'package:teamconnect/general/resources/dimension.dart';
import 'package:teamconnect/general/styles/colors.dart';

class _Constant {
  static const double cardCornerRadius = 5;
  static const double cardInsets = 7;
  static const Color iconBackground = AppColors.paleBlue;
  static const Color iconCompletedBackground = Color.fromRGBO(73, 135, 230, 1);
  static const double titleTextSize = 14;
}

class TextAmountWidget extends StatefulWidget {
  final String title;
  final String amount;
  final Color iconBackgroundColor;
  final Color iconCompletedBackgroundColor;
  final Widget icon;
  final bool showShadow;
  final TextStyle textStyle;
  final isCompletable;
  final isCompleted;

  TextAmountWidget({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.amount,
    this.iconBackgroundColor = _Constant.iconBackground,
    this.iconCompletedBackgroundColor = _Constant.iconCompletedBackground,
    this.showShadow = false,
    this.textStyle,
    this.isCompletable = false,
    this.isCompleted = false,
  }) : super(key: key);

  @override
  _TextAmountWidget createState() => _TextAmountWidget();
}

class _TextAmountWidget extends State<TextAmountWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(_Constant.cardInsets),
        child: Row(
          children: [
            SizedBox(
                height: AppDimensions.textAmountIconSize,
                width: AppDimensions.textAmountIconSize,
                child: widget.icon),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                widget.title,
                style: widget.textStyle ??
                    TextStyle(
                      color: AppColors.textMain,
                      fontWeight: FontWeight.w600,
                      fontSize: _Constant.titleTextSize,
                    ),
              ),
            ),
            SizedBox(width: 10),
            Text(
              widget.amount,
              style: widget.textStyle ??
                  TextStyle(
                    color: AppColors.textMain,
                    fontWeight: FontWeight.w600,
                    fontSize: _Constant.titleTextSize,
                  ),
            ),
            SizedBox(width: 15),
          ],
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(_Constant.cardCornerRadius)),
    );
  }
}
