import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamconnect/Widgets/bottom_nav_bar.dart';
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
      return Scaffold(
          bottomNavigationBar: BottomNavigationConnect(index: 0),
          body: SafeArea(
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
                  _buildOveviewTransactionSelector(store.activeThemeData),
                  SizedBox(height: AppDimensions.cardsSpacing),
                  Visibility(
                    visible: _viewMode == UnitLinkMode.overview,
                    child:
                        _buildOverviewSection(store.activeThemeData, context),
                  ),
                  Visibility(
                    visible: _viewMode == UnitLinkMode.transactions,
                    child: _buildTransactionSection(store.activeThemeData),
                  ),
                  Visibility(
                    visible: _viewMode == UnitLinkMode.overview,
                    child:
                        _buildOverviewSection(store.activeThemeData, context),
                  ),
                  Visibility(
                    visible: _viewMode == UnitLinkMode.transactions,
                    child: _buildTransactionSection(store.activeThemeData),
                  ),
                ],
              ),
            ),
          )));
    });
  }

  _buildOverviewSection(AppTheme theme, BuildContext context) {}
  _buildTransactionSection(AppTheme theme) {}

  _buildOveviewTransactionSelector(AppTheme theme) {
    var width =
        (MediaQuery.of(context).size.width - 2 * AppDimensions.largePadding);
    //     2.0 -
    // AppDimensions.smallPadding;

    var values = ["1", "2", "3", "4"];
    var generalProvider = Provider.of<General>(context, listen: false);
    return buildToggleGroup(
        generalProvider, _unitLinkToggleSelectedIndex(), values, width,
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
