import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamconnect/general/resources/app_themes.dart';
import 'package:teamconnect/general/resources/dimension.dart';
import 'package:teamconnect/general/styles/colors.dart';
import 'package:teamconnect/providers/general.dart';

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
          color: Colors.white,
          border:
              Border.all(color: AppColors.gray, width: _Constant.borderWidth),
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
          child: Text(title, //
              style: appTheme.primaryClickableTextStyle()),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
