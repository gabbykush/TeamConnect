class SecondaryButton extends StatelessWidget {
  final String title;
  final Color color;
  final GestureTapCallback onPressed;

  SecondaryButton({
    Key key,
    @required this.title,
    this.color,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = Provider.of<General>(context).activeThemeData;

    return SizedBox(
      height: AppDimensions.buttonHeight,
      width: double.infinity,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.buttonCornerRadius),
        ),
        color: color ?? appTheme.secondaryAccentColor(),
        key: UniqueKey(),
        child: Text(title, style: appTheme.textSecondaryButtonStyle()),
        onPressed: onPressed,
      ),
    );
  }
}
