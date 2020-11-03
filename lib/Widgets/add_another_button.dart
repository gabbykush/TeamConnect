import 'package:flutter/cupertino.dart';

class _Constant {
  static const double cardCornerRadius = 5;
  static const double borderWidth = 1.75;
}

class AddAnotherButton extends StatelessWidget {
  final String title;
  final Color color;
  final GestureTapCallback onPressed;

  AddAnotherButton({
    Key key,
    @required this.title,
    this.color,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = Provider.of<General>(context).activeThemeData;

    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: appTheme.primaryAccentColor(),
              width: _Constant.borderWidth),
          borderRadius:
              BorderRadius.all(Radius.circular(_Constant.cardCornerRadius))),
      child: SizedBox(
        height: AppDimensions.buttonHeight,
        width: double.infinity,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_Constant.cardCornerRadius),
          ),
          color: color ?? appTheme.selectedSwitchColor(),
          key: UniqueKey(),
          child: Text(title, style: appTheme.primaryClickableTextStyle()),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
