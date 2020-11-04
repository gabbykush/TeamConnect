import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teamconnect/general/resources/dimension.dart';
import 'package:teamconnect/general/styles/colors.dart';

class _Constant {
  static const double cardCornerRadius = 20;
  static const double miniCardCornerRadius = 15;

  static const double cardInsets = 7;
  static const Color iconBackground = AppColors.paleBlue;
  static const Color iconCompletedBackground = Color.fromRGBO(73, 135, 230, 1);
  static const double iconPaddingAround = 12;
  static const double iconBackgroundCornerRadius = 20;
  static const double shadowOpacity = 0.2;
  static const double shadowBlurRadius = 20;
  static const double shadowOffsetX = 0;
  static const double shadowOffsetY = 10;
  static const double titleTextSize = 14;
  static const double subTitleTextSize = 12;
}

class IconSubtitleButton extends StatefulWidget {
  final String title;
  final String amount;
  final String subtitle;
  final Color iconBackgroundColor;
  final Color iconCompletedBackgroundColor;
  final Widget icon;
  final GestureTapCallback onPressed;
  final bool showShadow;
  final TextStyle textStyle;
  final isCompletable;
  final isCompleted;
  final isEditable;

  IconSubtitleButton({
    Key key,
    @required this.title,
    @required this.onPressed,
    @required this.subtitle,
    @required this.amount,
    this.iconBackgroundColor = _Constant.iconBackground,
    this.iconCompletedBackgroundColor = _Constant.iconCompletedBackground,
    @required this.icon,
    this.showShadow = false,
    this.textStyle,
    this.isEditable = false,
    this.isCompletable = false,
    this.isCompleted = false,
  }) : super(key: key);

  @override
  _IconSubtitleButton createState() => _IconSubtitleButton();
}

class _IconSubtitleButton extends State<IconSubtitleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(_Constant.cardInsets),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIcon(),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: widget.textStyle ??
                          TextStyle(
                            color: AppColors.textMain,
                            fontWeight: FontWeight.w600,
                            fontSize: _Constant.titleTextSize,
                          ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      widget.subtitle,
                      style: widget.textStyle ??
                          TextStyle(
                            color: AppColors.gray,
                            fontWeight: FontWeight.w600,
                            fontSize: _Constant.subTitleTextSize,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.all(_Constant.miniCardCornerRadius),
                decoration: BoxDecoration(
                    color: widget.isEditable == false
                        ? Colors.white
                        : AppColors.primarySwatch,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(_Constant.cardCornerRadius),
                      bottomRight: Radius.circular(_Constant.cardCornerRadius),
                    )),
                child: Text(
                  widget.amount,
                  style: widget.textStyle ??
                      TextStyle(
                        color: AppColors.textMain,
                        fontWeight: FontWeight.w600,
                        fontSize: _Constant.titleTextSize,
                      ),
                ),
              ),
              SizedBox(width: 15),
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(_Constant.cardCornerRadius)),
      ),
    );
  }

  _buildIcon() => widget.isCompletable && widget.isCompleted
      ? _buildCompletedStepIcon()
      : _buildDefaultIcon();

  _buildCompletedStepIcon() {
    return Container(
      height: AppDimensions.roundButtonSize,
      width: AppDimensions.roundButtonSize,
      child: Center(
        child: SizedBox(
          height: AppDimensions.roundButtonCompletedIconSize,
          width: AppDimensions.roundButtonCompletedIconSize,
          //child: Images.iconCompletedStep,
        ),
      ),
      decoration: BoxDecoration(
          color: widget.iconCompletedBackgroundColor,
          borderRadius:
              BorderRadius.circular(_Constant.iconBackgroundCornerRadius),
          boxShadow: [
            BoxShadow(
              color: widget.iconCompletedBackgroundColor
                  .withOpacity(_Constant.shadowOpacity),
              blurRadius: _Constant.shadowBlurRadius,
              offset: Offset(_Constant.shadowOffsetX, _Constant.shadowOffsetY),
            )
          ]),
    );
  }

  _buildDefaultIcon() {
    return Container(
      height: AppDimensions.roundButtonSize,
      width: AppDimensions.roundButtonSize,
      child: Padding(
        padding: const EdgeInsets.all(_Constant.iconPaddingAround),
        child: widget.icon,
      ),
      decoration: BoxDecoration(
          color: widget.iconBackgroundColor,
          borderRadius:
              BorderRadius.circular(_Constant.iconBackgroundCornerRadius),
          boxShadow: [
            BoxShadow(
              color: widget.showShadow
                  ? widget.iconBackgroundColor
                      .withOpacity(_Constant.shadowOpacity)
                  : Colors.transparent,
              blurRadius: _Constant.shadowBlurRadius,
              offset: Offset(_Constant.shadowOffsetX, _Constant.shadowOffsetY),
            )
          ]),
    );
  }
}
