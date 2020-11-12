import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamconnect/Widgets/icon_large_button.dart';
import 'package:teamconnect/Widgets/ui_components.dart';
import 'package:teamconnect/general/resources/app_themes.dart';
import 'package:teamconnect/general/resources/dimension.dart';
import 'package:teamconnect/providers/general.dart';

class GroupsPage extends StatefulWidget {
  @override
  _GroupsPageState createState() => _GroupsPageState();
}

enum UnitLinkMode { overview, transactions }

class _GroupsPageState extends State<GroupsPage> {
  UnitLinkMode _viewMode = UnitLinkMode.overview;

  @override
  Widget build(BuildContext context) {
    return Consumer<General>(builder: (context, store, child) {
      return Center(
          child: SafeArea(
              child: Padding(
        padding: const EdgeInsets.only(
            top: AppDimensions.defaultPadding,
            left: AppDimensions.defaultPadding,
            right: AppDimensions.defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildHeader(context,
                  title: "Groups", subtitle: "Connect with people"),
              _buildOveviewTransactionSelector(),
              SizedBox(height: AppDimensions.cardsSpacing),
              Visibility(
                visible: _viewMode == UnitLinkMode.overview,
                child: _buildOverviewSection(),
              ),
              Visibility(
                visible: _viewMode == UnitLinkMode.transactions,
                child: _buildTransactionSection(),
              ),
              Visibility(
                visible: _viewMode == UnitLinkMode.overview,
                child: _buildOverviewSection(),
              ),
              Visibility(
                visible: _viewMode == UnitLinkMode.transactions,
                child: _buildTransactionSection(),
              ),
            ],
          ),
        ),
      )));
    });
  }

  _buildOverviewSection() {
    return Container(
        child: Column(
      children: [IconLargeButton(title: "Group 1", onPressed: null)],
    ));
  }

  _buildTransactionSection() {
    return Container(
        child: Column(
      children: [IconLargeButton(title: "Group 1", onPressed: null)],
    ));
  }

  _buildOveviewTransactionSelector() {
    var width =
        (MediaQuery.of(context).size.width - 2 * AppDimensions.largePadding);
    var values = ["1", "2", "3", "4"];
    return buildToggleGroup(_unitLinkToggleSelectedIndex(), values, width,
        (value) {
      setState(() {
        switch (value) {
          case 0:
            _viewMode = UnitLinkMode.overview;
            break;
          case 1:
            _viewMode = UnitLinkMode.transactions;
            break;
          case 2:
            _viewMode = UnitLinkMode.overview;
            break;
          case 3:
            _viewMode = UnitLinkMode.transactions;
            break;
          default:
            break;
        }
      });
    });
  }

  int _unitLinkToggleSelectedIndex() {
    switch (_viewMode) {
      case UnitLinkMode.overview:
        return 0;
      case UnitLinkMode.transactions:
        return 1;
      case UnitLinkMode.overview:
        return 2;
      case UnitLinkMode.transactions:
        return 3;
      default:
        return 0;
    }
  }

  //   Align _buildTopNavigation() {
  //   return Align(
  //     alignment: Alignment.topLeft,
  //     child: IconButton(
  //       padding: EdgeInsets.all(AppDimensions.smallPadding),
  //       icon: Icon(Icons.arrow_back),
  //       onPressed: () {
  //         Navigator.of(context).pop();
  //       },
  //     ),
  //   );
  // }

}
