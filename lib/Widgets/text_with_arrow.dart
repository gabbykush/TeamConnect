import 'package:flutter/material.dart';
import 'package:teamconnect/general/resources/dimension.dart';
import 'package:teamconnect/general/styles/colors.dart';

// class _Constant {
//   static const double cardCornerRadius = 20;
//   static const double cardInsets = 6;
//   static const Color iconBackground = AppColors.paleBlue;
//   static const Color iconCompletedBackground = Color.fromRGBO(73, 135, 230, 1);
//   static const double titleTextSize = 14;
// }
class _Constant {
  static const double cardCornerRadius = 20;
  static const double cardInsets = 7;
  static const Color iconBackground = AppColors.paleBlue;
  static const Color iconCompletedBackground = Color.fromRGBO(73, 135, 230, 1);
  static const double iconBackgroundCornerRadius = 20;
  static const double shadowOpacity = 0.2;
  static const double shadowBlurRadius = 20;
  static const double shadowOffsetX = 0;
  static const double shadowOffsetY = 10;
  static const double titleTextSize = 14;
}

class TextWithArrow extends StatefulWidget {
  final String title;
  final Color iconBackgroundColor;
  final Color iconCompletedBackgroundColor;
  final bool showShadow;
  final TextStyle textStyle;
  final isCompletable;
  final isCompleted;
  final GestureTapCallback onPressed;

  TextWithArrow({
    Key key,
    @required this.title,
    @required this.onPressed,
    this.iconBackgroundColor = _Constant.iconBackground,
    this.iconCompletedBackgroundColor = _Constant.iconCompletedBackground,
    this.showShadow = false,
    this.textStyle,
    this.isCompletable = false,
    this.isCompleted = false,
  }) : super(key: key);

  @override
  _TextWithArrow createState() => _TextWithArrow();
}

class _TextWithArrow extends State<TextWithArrow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(_Constant.cardInsets),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 16),
            Expanded(
              child: Text(
                widget.title,
                style: widget.textStyle ??
                    TextStyle(
                      color: AppColors.gray,
                      fontWeight: FontWeight.w600,
                      fontSize: _Constant.titleTextSize,
                    ),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
                onTap: widget.onPressed,
                child: Container(
                  height: 30,
                  width: 30,
                  child: Center(
                    child: SizedBox(
                      height: AppDimensions.roundButtonCompletedIconSize,
                      width: AppDimensions.roundButtonCompletedIconSize,
                      child: Icon(Icons.arrow_forward),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: _Constant.iconBackground,
                      borderRadius: BorderRadius.circular(
                          _Constant.iconBackgroundCornerRadius),
                      boxShadow: [
                        BoxShadow(
                          color: widget.iconCompletedBackgroundColor
                              .withOpacity(_Constant.shadowOpacity),
                          blurRadius: _Constant.shadowBlurRadius,
                          offset: Offset(
                              _Constant.shadowOffsetX, _Constant.shadowOffsetY),
                        )
                      ]),
                )),
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
