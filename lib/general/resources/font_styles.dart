import 'package:flutter/material.dart';
import 'package:teamconnect/general/styles/colors.dart';

const String defaultFontFamily = "Inter";

class FontSizes {
  const FontSizes();

  double get sectionText => 13.0;
  double get checkBoxTextSize => 14.0;
  double get defaultTextSize => 15.0;
  double get smallTextSize => 12.0;
  double get titleSize => 28.0;
  double get secondaryTitleSize => 22.0;
  double get buttonTextSize => 15.0;
  double get floatingLabelSize => 13.0;
  double get largeTextSize => 24.0;
  double get toastLabelSize => 14.0;
  double get inputTextSize => 14.0;
  double get inputHintTextSize => 13.0;
  double get inputErrorTextSize => 12.0;
  double get pickerLargeTextSize => 16.0;
  double get pickerRegularTextSize => 14.0;
  double get timePickerFontSize => 40.0;
}

class FontStyle {
  static FontSizes fontSizes = const FontSizes();

  static final TextStyle titleLight = TextStyle(
    color: AppColors.primaryAccent,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.titleSize,
  );

  static final TextStyle secondaryTitleLight = TextStyle(
    color: AppColors.primaryAccent,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.secondaryTitleSize,
  );

  static final TextStyle bodyLight = TextStyle(
    color: AppColors.textMain,
    fontWeight: FontWeight.normal,
    fontSize: fontSizes.defaultTextSize,
  );

  static final TextStyle bodyLightSelected =
      bodyLight.copyWith(color: AppColors.primaryAccent);

  static final TextStyle smallBodyLight = bodyLight.copyWith(
    fontSize: fontSizes.smallTextSize,
  );

  static final TextStyle categoryTitleLight = TextStyle(
    color: AppColors.textMain,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.sectionText,
  );

  static final TextStyle notificationNumberLight = TextStyle(
      color: AppColors.secondaryAccent,
      fontSize: fontSizes.smallTextSize,
      fontWeight: FontWeight.w600);

  static final TextStyle primaryButtonLight = TextStyle(
    color: AppColors.primaryButtonText,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.buttonTextSize,
  );

  static final TextStyle secondaryButtonLight = TextStyle(
    color: AppColors.secondaryButtonText,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.buttonTextSize,
  );

  static final TextStyle primaryClickableTextLight = TextStyle(
    color: AppColors.primaryAccent,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.buttonTextSize,
  );

  static final TextStyle secondaryClickableTextLight = TextStyle(
    color: AppColors.textMain,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.buttonTextSize,
  );

  // Input
  static final TextStyle inputText = TextStyle(
    color: AppColors.inputText,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.inputTextSize,
  );

  static final TextStyle inputTextHint = TextStyle(
    color: AppColors.inputTextHint,
    fontWeight: FontWeight.normal,
    fontSize: fontSizes.inputHintTextSize,
  );

  static final TextStyle inputLabelGrayed = TextStyle(
    color: AppColors.secondaryButtonText.withOpacity(0.5),
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.floatingLabelSize,
  );

  static final TextStyle inputLabel = TextStyle(
    color: AppColors.secondaryButtonText,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.floatingLabelSize,
  );

  static final TextStyle inputErrorLabel = TextStyle(
    color: AppColors.error,
    fontWeight: FontWeight.w500,
    fontSize: fontSizes.inputErrorTextSize,
  );
  // ---
  static final TextStyle messageTitleTextLight = TextStyle(
    color: AppColors.textMain,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.largeTextSize,
  );

  static final TextStyle toastTextLight = TextStyle(
    color: AppColors.toastText,
    fontWeight: FontWeight.normal,
    fontSize: fontSizes.toastLabelSize,
  );

  static final TextStyle checkboxTextLight = TextStyle(
    color: AppColors.textMain,
    fontWeight: FontWeight.normal,
    fontSize: fontSizes.checkBoxTextSize,
  );

  static final sectionTextLight = TextStyle(
    color: AppColors.textMain,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.sectionText,
  );

  static final pickerTextLargeLight = TextStyle(
    color: AppColors.textMain,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.pickerLargeTextSize,
  );

  static final pickerTextRegularLight = TextStyle(
    color: AppColors.textMain,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.pickerRegularTextSize,
  );

  static final pickerItemText = TextStyle(
    color: AppColors.textMain,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.checkBoxTextSize,
  );

  static final timePickerTextLight = TextStyle(
    color: AppColors.textMain,
    fontWeight: FontWeight.w600,
    fontSize: fontSizes.timePickerFontSize,
  );

  static final unselectedTabLabelLight = TextStyle(
    color: AppColors.textMain.withOpacity(0.4),
    fontWeight: FontWeight.w500,
    fontSize: fontSizes.smallTextSize,
  );

  static final selectedTabLabelLight = TextStyle(
    color: AppColors.primaryAccent,
    fontWeight: FontWeight.w500,
    fontSize: fontSizes.smallTextSize,
  );

  //Dark Theme font styles
  static final TextStyle titleDark =
      titleLight.copyWith(color: AppColorsDark.textMain);

  static final TextStyle secondaryTitleDark =
      secondaryTitleLight.copyWith(color: AppColorsDark.textMain);

  static final TextStyle bodyDark =
      bodyLight.copyWith(color: AppColorsDark.textMain);

  static final TextStyle smallBodyDark =
      smallBodyLight.copyWith(color: AppColorsDark.textMain);

  static final TextStyle primaryButtonDark =
      primaryButtonLight.copyWith(color: AppColorsDark.primaryButtonText);

  static final TextStyle floatingLabelDark =
      secondaryButtonLight.copyWith(color: AppColorsDark.textSecondary);

  static final TextStyle secondaryButtonDark =
      secondaryButtonLight.copyWith(color: AppColorsDark.secondaryButtonText);

  static final TextStyle primaryClickableTextDark =
      primaryClickableTextLight.copyWith(color: AppColorsDark.primaryAccent);

  static final TextStyle secondaryClickableTextDark =
      secondaryClickableTextLight.copyWith(color: AppColorsDark.textMain);

  static final TextStyle messageTitleTextDark =
      messageTitleTextLight.copyWith(color: AppColorsDark.textMain);

  static final TextStyle toastTextDark =
      toastTextLight.copyWith(color: AppColorsDark.toastText);

  static final TextStyle checkboxTextDark =
      checkboxTextLight.copyWith(color: AppColorsDark.textMain);

  static final TextStyle categoryTitleDark =
      categoryTitleLight.copyWith(color: AppColorsDark.textMain);

  static final TextStyle notificationNumberDark =
      notificationNumberLight.copyWith(color: AppColorsDark.secondaryAccent);

  static final TextStyle sectionTextDark =
      sectionTextLight.copyWith(color: AppColorsDark.textMain);

  static final TextStyle bodyDarkSelected =
      bodyDark.copyWith(color: AppColors.primaryAccent);

  static final TextStyle pickerTextLargeDark =
      pickerTextLargeLight.copyWith(color: AppColorsDark.primaryAccent);

  static final TextStyle pickerTextRegularDark =
      pickerTextRegularLight.copyWith(color: AppColorsDark.primaryAccent);

  static final TextStyle timePickerTextDark =
      timePickerTextLight.copyWith(color: AppColorsDark.textMain);

  static final TextStyle unselectedTabLabelDark = unselectedTabLabelLight
      .copyWith(color: AppColors.textMain.withOpacity(0.4));

  static final TextStyle selectedTabLabelDark =
      unselectedTabLabelLight.copyWith(color: AppColorsDark.primaryAccent);
}
