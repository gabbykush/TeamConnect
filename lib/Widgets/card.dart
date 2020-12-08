import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:teamconnect/Widgets/line_chart.dart';
import 'package:teamconnect/Widgets/text_and_amount_widget.dart';
import 'package:teamconnect/Widgets/ui_components.dart';
import 'package:teamconnect/general/resources/app_themes.dart';
import 'package:teamconnect/general/resources/dimension.dart';
import 'package:teamconnect/providers/general.dart';

enum ChartMode { going, ignore, maybe }

class Funds {
  Widget icon;
  String title;
  String amount;

  Funds({this.icon, this.title, this.amount});
}

class _Constant {
  static const double cardCornerRadius = 20;
}

// ignore: must_be_immutable
class EventCard extends StatefulWidget {
  final String title;
  final String time;
  final String amount;
  final String subtitle;
  final Widget icon;
  final GestureTapCallback onPressed;
  final TextStyle textStyle;
  final List fundsList;
  final bool buildFunds;
  final bool buildCharts;

  EventCard({
    @required this.title,
    @required this.subtitle,
    @required this.time,
    this.amount,
    this.icon,
    this.onPressed,
    this.textStyle,
    this.fundsList,
    this.buildFunds,
    this.buildCharts,
  });

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  ChartMode _chartMode = ChartMode.maybe;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = Provider.of<General>(context).activeThemeData;
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        child: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  color: theme.secondaryAccentColor(),
                  borderRadius: BorderRadius.all(
                      Radius.circular(_Constant.cardCornerRadius))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: AppDimensions.defaultPadding,
                    left: AppDimensions.defaultPadding,
                    right: AppDimensions.defaultPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: AppDimensions.cardsSpacing),
                    buildHeader(
                      context,
                      title: widget.title,
                      subtitle: widget.subtitle,
                    ),
                    SizedBox(height: AppDimensions.mediumSpacing),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.time),
                        SizedBox(height: AppDimensions.mediumSpacing),
                        Row(
                          children: [
                            Icon(Icons.person),
                            Icon(Icons.person),
                            Icon(Icons.person)
                          ],
                        )
                      ],
                    ),
                    _buildCharts(theme, context, widget.buildCharts),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  _buildNothing() {
    return SizedBox(height: AppDimensions.cardsSpacing);
  }

//If buildChart is false, do not build fund charts
  _buildCharts(AppTheme theme, BuildContext context, bool buildCharts) {
    return buildCharts == false
        ? _buildNothing()
        : Column(
            children: [
              _buildSelectedChart(theme, context),
              SizedBox(height: AppDimensions.mediumSpacing),
              _buildTimeSelector(theme, context),
              SizedBox(height: AppDimensions.mediumSpacing),
            ],
          );
  }

  ///MUST PASS List info
  _buildSelectedChart(AppTheme theme, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppDimensions.cardsSpacing),
            ],
          ),
        ),
      ],
    );
  }

  _buildTimeSelector(AppTheme theme, BuildContext context) {
    var width =
        (MediaQuery.of(context).size.width - 2 * AppDimensions.largePadding) /
                2.0 -
            AppDimensions.smallPadding;

    var values = ['going', 'ignore', 'maybe'];
    var generalProvider = Provider.of<General>(context, listen: false);

    return Column(children: [
      buildToggleGroup(
          generalProvider, _unitLinkTimeSelectedIndex(), values, width,
          (value) {
        setState(() {
          switch (value) {
            case 0:
              _chartMode = ChartMode.going;
              break;
            case 1:
              _chartMode = ChartMode.ignore;
              break;
            case 2:
              _chartMode = ChartMode.maybe;
              break;
            default:
              break;
          }
        });
      }),
    ]);
  }

  int _unitLinkTimeSelectedIndex() {
    switch (_chartMode) {
      case ChartMode.going:
        return 0;
      case ChartMode.ignore:
        return 1;
      case ChartMode.maybe:
        return 2;
    }
    return 1;
  }
}
