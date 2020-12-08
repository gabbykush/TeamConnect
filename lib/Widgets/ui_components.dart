import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamconnect/general/resources/app_themes.dart';
import 'package:teamconnect/general/resources/dimension.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:teamconnect/general/styles/colors.dart';
import 'package:teamconnect/providers/general.dart';
import 'package:toggle_switch/toggle_switch.dart';

class _Constant {
  static const Color bottomSheetCornerColor = Color(0xff737373);
}

Consumer buildHeader(
  BuildContext context, {
  String title,
  String subtitle = '',
  String subtitleActionText,
  VoidCallback onSubtitleActionTextPressed,
}) {
  return Consumer<General>(builder: (context, store, child) {
    _buildSubtitle(
        String text, String actionText, VoidCallback onActionPressed) {
      if (actionText != null) {
        final splittedTextSpans = text
            .split(actionText)
            .map(
              (e) => TextSpan(
                text: e,
                style: store.activeThemeData.textBodyStyle(),
              ),
            )
            .toList();
        final actionTextSpan = TextSpan(
          text: actionText,
          style: store.activeThemeData.primaryClickableTextStyle().copyWith(
                decoration: TextDecoration.underline,
                fontSize: 20,
              ),
          recognizer: TapGestureRecognizer()..onTap = onActionPressed,
        );

        var textSpans = List<TextSpan>();

        for (final item in splittedTextSpans) {
          textSpans.add(item);
          textSpans.add(actionTextSpan);
        }

        textSpans.removeLast();

        return RichText(
          text: TextSpan(
            style: store.activeThemeData.textBodyStyle(),
            children: textSpans,
          ),
        );
      }
      return Text(
        subtitle,
        style: store.activeThemeData.textBodyStyle(),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryAccent,
        borderRadius: BorderRadius.circular(AppDimensions.modalRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 10.0,
            width: 10,
            color: AppColors.secondaryAccent,
          ),
          Text(
            title,
            style: store.activeThemeData.textTitleStyle(),
          ),
          Container(
            height: 10.0,
            width: 1000.0,
            color: AppColors.secondaryAccent,
          ),
          Container(
            height: 2.0,
            width: 300.0,
            color: AppColors.primaryAccent,
          ),
          Container(
            height: 15.0,
            width: 1000.0,
            color: AppColors.secondaryAccent,
          ),
          Visibility(
            visible: subtitle.isNotEmpty,
            child: _buildSubtitle(
                subtitle, subtitleActionText, onSubtitleActionTextPressed),
          ),
          SizedBox(height: AppDimensions.smallMargin),
          SizedBox(height: AppDimensions.smallMargin),
        ],
      ),
    );
  });
}

Future<T> showCustomModalBottomSheet<T>({
  @required BuildContext context,
  @required Widget child,
  bool useDynamicHeight = true,
  double height,
  bool isScrollControlled = true,
  bool useSafeArea = true,
  bool isDismissible = true,
  bool enableDrag = true,
}) {
  var theme = Provider.of<General>(context, listen: false).activeThemeData;

  Widget _content() {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final verticalPadding = mediaQuery.padding.vertical;
    var fullHeight = screenHeight -
        verticalPadding; //-AppDimensions.fullHeightModalTopMargin;

    return Container(
      color: _Constant.bottomSheetCornerColor,
      height: useDynamicHeight ? null : (height ?? fullHeight),
      child: Container(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppDimensions.modalRadius),
              child: child,
            ),
            SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppDimensions.defaultPadding,
                  ),
                  Center(
                      // child: Images.iconPopupLine,
                      ),
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: theme.secondarySwatch(),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(AppDimensions.modalRadius),
            topRight: const Radius.circular(AppDimensions.modalRadius),
          ),
        ),
      ),
    );
  }

  return showModalBottomSheet(
    isScrollControlled: isScrollControlled,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    context: context,
    builder: (context) {
      if (useSafeArea) {
        return SafeArea(
          child: useDynamicHeight ? Wrap(children: [_content()]) : _content(),
        );
      } else {
        return useDynamicHeight ? Wrap(children: [_content()]) : _content();
      }
    },
  );
}

Widget buildToggleGroup(
        General generalProvider,
        int initialSelectedIndex,
        List<String> values,
        double itemMinWidth,
        onOptionSelected(int index)) =>
    ToggleSwitch(
      cornerRadius: AppDimensions.buttonCornerRadius,
      activeBgColor: AppColors.secondaryAccent,
      activeFgColor: AppColors.primaryAccent,
      inactiveBgColor: AppColors.lightGray,
      inactiveFgColor: AppColors.primaryAccent,
      initialLabelIndex: initialSelectedIndex,
      minWidth: itemMinWidth,
      labels: values,
      onToggle: (index) {
        onOptionSelected(index);
      },
    );

KeyboardActionsConfig defaultKeyboardConfig(
  List<FocusNode> focusNodes,
  BuildContext context,
  AppTheme theme, {
  bool displayArrows = true,
  bool isDoneButtonVisible = true,
}) {
  _actionItem(FocusNode focusNode, bool showDoneButton, bool displayArrows) {
    return KeyboardActionsItem(
      focusNode: focusNode,
      displayArrows: displayArrows,
      toolbarButtons: [
        (node) {
          return GestureDetector(
            onTap: () => node.unfocus(),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.mediumPadding,
              ),
              child: Text(
                "Done",
                style: theme.textSecondaryButtonStyle(),
              ),
            ),
          );
        }
      ],
    );
  }

  return KeyboardActionsConfig(
    keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
    keyboardBarColor: theme.primarySwatch(),
    nextFocus: true,
    actions: focusNodes
        .map(
          (e) => _actionItem(
            e,
            isDoneButtonVisible,
            displayArrows,
          ),
        )
        .toList(),
  );
}
