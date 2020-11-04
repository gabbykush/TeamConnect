import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teamconnect/general/resources/box_decorations.dart';
import 'package:teamconnect/general/resources/font_styles.dart';
import 'package:teamconnect/general/resources/outline_input_border.dart';
import 'package:teamconnect/general/styles/colors.dart';

abstract class AppTheme {
  String fontFamily();

  Color primaryAccentColor();
  Color primaryAccentColorDisabled();
  Color secondaryAccentColor();
  Color errorColor();
  Color infoSuccessColor();
  Color infoErrorColor();
  Color infoColor();
  Color primaryTextColor();

  Color primarySwatch();
  Color secondarySwatch();

  Color secondaryButton();

  Color checkboxBorder();
  Color defaultBorder();

  TextStyle textTitleStyle();
  TextStyle textSecondaryTitleStyle();
  TextStyle textBodyStyle();
  TextStyle textSmallBodyStyle();
  TextStyle messageTitleStyle();

  TextStyle textPrimaryButtonStyle();
  TextStyle textSecondaryButtonStyle();
  TextStyle textLinkButtonStyle();

  TextStyle inputLabelStyle();
  TextStyle inputLabelFilledStateStyle();
  TextStyle inputTextHintStyle();
  TextStyle inputTextStyle();
  TextStyle inputErrorMessageStyle();
  TextStyle categoryTitleStyle();
  TextStyle notificationNumberStyle();
  TextStyle pickerItemText();

  TextStyle primaryClickableTextStyle();
  TextStyle secondaryClickableTextStyle();
  TextStyle toastTextStyle();
  TextStyle textBodySelected();

  BoxDecoration inputTextDecoration();
  BoxDecoration defaultCardWithShadowBoxDecoration();

  OutlineInputBorder clearOutlineInputBorder();
  OutlineInputBorder enabledOutlineInputBorder();
  OutlineInputBorder errorOutlineInputBorder();
  OutlineInputBorder focusedOutlineInputBorder();

  TextStyle checkboxTextStyle();

  Color selectedSwitchColor();
  Color switchBackgroundColor();

  Color fileUploadActionContainerBorder();
  Color fileUploadActionContainerBackground();

  Color fileUploadStatusCompleted();
  Color fileUploadStatusUploading();
  Color fileUploadStatusError();

  TextStyle sectionTextStyle();

  TextStyle pickerTextLargeStyle();
  TextStyle pickerTextRegularStyle();

  TextStyle timePickerTextStyle();

  Color unselectedTabIcon();
  Color selectedTabIcon();
  TextStyle unselectedTabLabel();
  TextStyle selectedTabLabel();
}

AppTheme get lightTheme => LightAppTheme();
AppTheme get darkTheme => DarkAppTheme();

class LightAppTheme implements AppTheme {
  @override
  String fontFamily() => defaultFontFamily;

  @override
  Color primaryAccentColor() => AppColors.primaryAccent;
  @override
  Color primaryAccentColorDisabled() => AppColors.primaryAccent.withAlpha(80);
  @override
  Color secondaryAccentColor() => AppColors.secondaryAccent;
  @override
  Color errorColor() => AppColors.error;
  @override
  Color infoSuccessColor() => AppColors.infoSuccess;
  @override
  Color infoErrorColor() => AppColors.infoError;
  @override
  Color infoColor() => AppColors.info;
  @override
  Color primaryTextColor() => AppColors.textMain;

  @override
  Color primarySwatch() => AppColors.primarySwatch;
  @override
  Color secondarySwatch() => AppColors.secondarySwatch;

  @override
  Color secondaryButton() => AppColors.secondaryButton;
  @override
  Color checkboxBorder() => AppColors.checkboxBorder;
  @override
  Color defaultBorder() => AppColors.defaultBorder;

  @override
  TextStyle textTitleStyle() => FontStyle.titleLight;
  @override
  TextStyle textSecondaryTitleStyle() => FontStyle.secondaryTitleLight;
  @override
  TextStyle textBodyStyle() => FontStyle.bodyLight;
  @override
  TextStyle textSmallBodyStyle() => FontStyle.smallBodyLight;
  @override
  TextStyle messageTitleStyle() => FontStyle.messageTitleTextLight;

  @override
  TextStyle textPrimaryButtonStyle() => FontStyle.primaryButtonLight;
  @override
  TextStyle textSecondaryButtonStyle() => FontStyle.secondaryButtonLight;
  @override
  TextStyle textLinkButtonStyle() => FontStyle.secondaryButtonLight;

  @override
  TextStyle inputLabelStyle() => FontStyle.inputLabel;
  @override
  TextStyle inputLabelFilledStateStyle() => FontStyle.inputLabelGrayed;
  @override
  TextStyle inputTextHintStyle() => FontStyle.inputTextHint;
  @override
  TextStyle inputTextStyle() => FontStyle.inputText;
  @override
  TextStyle inputErrorMessageStyle() => FontStyle.inputErrorLabel;

  @override
  TextStyle primaryClickableTextStyle() => FontStyle.primaryClickableTextLight;
  @override
  TextStyle secondaryClickableTextStyle() =>
      FontStyle.secondaryClickableTextLight;
  @override
  TextStyle toastTextStyle() => FontStyle.toastTextLight;

  @override
  BoxDecoration inputTextDecoration() => AppBoxDecoration.primaryInput;
  @override
  BoxDecoration defaultCardWithShadowBoxDecoration() =>
      AppBoxDecoration.defaultCardWithShadowBoxDecoration;

  @override
  OutlineInputBorder clearOutlineInputBorder() =>
      AppOutlineInputBorder.clearBorder;
  @override
  OutlineInputBorder errorOutlineInputBorder() =>
      AppOutlineInputBorder.errorBorder;
  @override
  OutlineInputBorder focusedOutlineInputBorder() =>
      AppOutlineInputBorder.focusedBorder;

  @override
  OutlineInputBorder enabledOutlineInputBorder() =>
      AppOutlineInputBorder.enabledBorder;

  @override
  TextStyle checkboxTextStyle() => FontStyle.checkboxTextLight;

  @override
  TextStyle categoryTitleStyle() => FontStyle.categoryTitleLight;

  @override
  Color selectedSwitchColor() => AppColors.secondaryAccent;

  @override
  Color switchBackgroundColor() => AppColors.switchBackground;

  @override
  Color fileUploadActionContainerBorder() =>
      AppColors.fileUploadActionContainerBorder;
  @override
  Color fileUploadActionContainerBackground() =>
      AppColors.fileUploadActionContainerBackground;
  @override
  Color fileUploadStatusCompleted() => AppColors.fileUploadStatusCompleted;
  @override
  Color fileUploadStatusUploading() => AppColors.fileUploadStatusUploading;
  @override
  Color fileUploadStatusError() => AppColors.fileUploadStatusError;

  @override
  TextStyle notificationNumberStyle() => FontStyle.notificationNumberLight;

  @override
  TextStyle pickerItemText() => FontStyle.pickerItemText;

  @override
  TextStyle sectionTextStyle() => FontStyle.sectionTextLight;

  @override
  TextStyle textBodySelected() => FontStyle.bodyLightSelected;

  @override
  TextStyle pickerTextLargeStyle() => FontStyle.pickerTextLargeLight;
  @override
  TextStyle pickerTextRegularStyle() => FontStyle.pickerTextRegularLight;

  @override
  TextStyle timePickerTextStyle() => FontStyle.timePickerTextLight;

  @override
  TextStyle unselectedTabLabel() => FontStyle.unselectedTabLabelLight;
  @override
  TextStyle selectedTabLabel() => FontStyle.selectedTabLabelLight;

  @override
  Color unselectedTabIcon() => AppColors.textMain.withOpacity(0.4);
  @override
  Color selectedTabIcon() => AppColors.primaryAccent;
}

class DarkAppTheme implements AppTheme {
  @override
  String fontFamily() => defaultFontFamily;

  @override
  Color primaryAccentColor() => AppColorsDark.primaryAccent;
  @override
  Color primaryAccentColorDisabled() =>
      AppColorsDark.primaryAccent.withAlpha(80);
  @override
  Color secondaryAccentColor() => AppColorsDark.primaryAccent;
  @override
  Color errorColor() => AppColorsDark.error;
  @override
  Color infoSuccessColor() => AppColorsDark.infoSuccess;
  @override
  Color infoErrorColor() => AppColorsDark.infoError;
  @override
  Color infoColor() => AppColorsDark.info;
  @override
  Color primaryTextColor() => AppColorsDark.textMain;

  @override
  Color primarySwatch() => AppColorsDark.primarySwatch;
  @override
  Color secondarySwatch() => AppColorsDark.secondarySwatch;

  @override
  Color secondaryButton() => AppColorsDark.secondaryButton;

  @override
  Color checkboxBorder() => AppColorsDark.checkboxBorder;
  @override
  Color defaultBorder() => AppColorsDark.defaultBorder;

  @override
  TextStyle textTitleStyle() => FontStyle.titleDark;
  @override
  TextStyle textSecondaryTitleStyle() => FontStyle.secondaryTitleDark;
  @override
  TextStyle textBodyStyle() => FontStyle.bodyDark;
  @override
  TextStyle textSmallBodyStyle() => FontStyle.smallBodyDark;
  @override
  TextStyle messageTitleStyle() => FontStyle.messageTitleTextDark;

  @override
  TextStyle textPrimaryButtonStyle() => FontStyle.secondaryButtonDark;
  @override
  TextStyle textSecondaryButtonStyle() => FontStyle.primaryButtonDark;
  @override
  TextStyle textLinkButtonStyle() => FontStyle.secondaryButtonLight;

  @override
  TextStyle inputLabelStyle() => FontStyle.inputLabel;
  @override
  TextStyle inputLabelFilledStateStyle() => FontStyle.inputLabelGrayed;
  @override
  TextStyle inputTextHintStyle() => FontStyle.inputTextHint;
  @override
  TextStyle inputTextStyle() => FontStyle.inputText;
  @override
  TextStyle inputErrorMessageStyle() => FontStyle.inputErrorLabel;

  @override
  TextStyle notificationNumberStyle() => FontStyle.notificationNumberDark;

  @override
  TextStyle primaryClickableTextStyle() => FontStyle.primaryClickableTextDark;
  @override
  TextStyle secondaryClickableTextStyle() =>
      FontStyle.secondaryClickableTextDark;
  @override
  TextStyle toastTextStyle() => FontStyle.toastTextDark;

  @override
  BoxDecoration inputTextDecoration() => AppBoxDecorationDark.primaryInput;
  @override
  BoxDecoration defaultCardWithShadowBoxDecoration() =>
      AppBoxDecorationDark.defaultCardWithShadowBoxDecoration;

  @override
  OutlineInputBorder clearOutlineInputBorder() =>
      AppOutlineInputBorder.clearBorder;
  @override
  OutlineInputBorder errorOutlineInputBorder() =>
      AppOutlineInputBorder.errorBorder;
  @override
  OutlineInputBorder focusedOutlineInputBorder() =>
      AppOutlineInputBorder.focusedBorder;

  @override
  OutlineInputBorder enabledOutlineInputBorder() =>
      AppOutlineInputBorder.enabledBorder;

  @override
  TextStyle checkboxTextStyle() => FontStyle.checkboxTextLight;

  @override
  TextStyle categoryTitleStyle() => FontStyle.categoryTitleDark;

  @override
  Color selectedSwitchColor() => AppColorsDark.secondaryAccent;

  @override
  Color switchBackgroundColor() => AppColorsDark.switchBackground;

  @override
  Color fileUploadActionContainerBorder() =>
      AppColorsDark.fileUploadActionContainerBorder;
  @override
  Color fileUploadActionContainerBackground() =>
      AppColorsDark.fileUploadActionContainerBackground;
  @override
  Color fileUploadStatusCompleted() => AppColorsDark.fileUploadStatusCompleted;
  @override
  Color fileUploadStatusUploading() => AppColorsDark.fileUploadStatusUploading;
  @override
  Color fileUploadStatusError() => AppColorsDark.fileUploadStatusError;

  @override
  TextStyle sectionTextStyle() => FontStyle.sectionTextDark;

  @override
  TextStyle textBodySelected() => FontStyle.bodyDarkSelected;

  @override
  TextStyle pickerTextLargeStyle() => FontStyle.pickerTextLargeDark;
  @override
  TextStyle pickerTextRegularStyle() => FontStyle.pickerTextRegularDark;

  @override
  TextStyle pickerItemText() => FontStyle.pickerItemText;

  @override
  TextStyle timePickerTextStyle() => FontStyle.timePickerTextDark;

  @override
  TextStyle unselectedTabLabel() => FontStyle.unselectedTabLabelDark;
  @override
  TextStyle selectedTabLabel() => FontStyle.selectedTabLabelDark;
  @override
  Color unselectedTabIcon() => AppColorsDark.textMain.withOpacity(0.4);
  @override
  Color selectedTabIcon() => AppColorsDark.primaryAccent;
}
