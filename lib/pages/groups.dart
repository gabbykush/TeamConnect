import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamconnect/Widgets/add_another_button.dart';
import 'package:teamconnect/Widgets/icon_large_button.dart';
import 'package:teamconnect/Widgets/ui_components.dart';
import 'package:teamconnect/general/resources/app_themes.dart';
import 'package:teamconnect/general/resources/dimension.dart';
import 'package:teamconnect/general/styles/colors.dart';
import 'package:teamconnect/providers/general.dart';

class GroupsPage extends StatefulWidget {
  @override
  _GroupsPageState createState() => _GroupsPageState();
}

enum UnitLinkMode { overview, transactions, overview1, transactions1 }

class _GroupsPageState extends State<GroupsPage> {
  UnitLinkMode _viewMode = UnitLinkMode.overview;
  List<IconLargeButton> _groups = List<IconLargeButton>();
  List<IconLargeButton> _groupsForDisplay = List<IconLargeButton>();

  @override
  Widget build(BuildContext context) {
    return Consumer<General>(builder: (context, store, child) {
      return Container(
          decoration: BoxDecoration(color: AppColors.lightBlue),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(
                top: AppDimensions.defaultPadding,
                left: AppDimensions.defaultPadding,
                right: AppDimensions.defaultPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildHeader(context,
                      title: "Groups", subtitle: "Connect with people"),
                  _searchBar(),
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
                    visible: _viewMode == UnitLinkMode.overview1,
                    child: _buildOverview1Section(),
                  ),
                  Visibility(
                    visible: _viewMode == UnitLinkMode.transactions1,
                    child: _buildTransaction1Section(),
                  ),
                  AddAnotherButton(title: "Create Group", onPressed: null),
                  SizedBox(height: AppDimensions.cardsSpacing),
                  AddAnotherButton(title: "Contacts ", onPressed: null),
                ],
              ),
            ),
          )));
    });
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(hintText: 'Search groups..'),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _groupsForDisplay = _groups.where((note) {
              var noteTitle = note.title.toLowerCase();
              return noteTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _buildOverviewSection() {
    return Container(
        child: Column(
      children: [
        IconLargeButton(
          title: "Group 1",
          onPressed: null,
          icon: Icon(Icons.group),
        ),
        SizedBox(height: AppDimensions.cardsSpacing),
        IconLargeButton(
          title: "Group 1",
          onPressed: null,
          icon: Icon(Icons.group),
        ),
        SizedBox(height: AppDimensions.cardsSpacing),
        IconLargeButton(
          title: "Group 1",
          onPressed: null,
          icon: Icon(Icons.group),
        ),
        SizedBox(height: AppDimensions.cardsSpacing),
        IconLargeButton(
          title: "Group 1",
          onPressed: null,
          icon: Icon(Icons.group),
        ),
        SizedBox(height: AppDimensions.cardsSpacing),
        IconLargeButton(
          title: "Group 1",
          onPressed: null,
          icon: Icon(Icons.group),
        ),
        SizedBox(height: AppDimensions.cardsSpacing),
      ],
    ));
  }

  _buildTransactionSection() {
    return Container(
        child: Column(
      children: [IconLargeButton(title: "Group 2", onPressed: null)],
    ));
  }

  _buildOverview1Section() {
    return Container(
        child: Column(
      children: [IconLargeButton(title: "Group 3", onPressed: null)],
    ));
  }

  _buildTransaction1Section() {
    return Container(
        child: Column(
      children: [IconLargeButton(title: "Group 4", onPressed: null)],
    ));
  }

  _buildOveviewTransactionSelector() {
    var generalProvider = Provider.of<General>(context, listen: false);

    var width =
        (MediaQuery.of(context).size.width - 2 * AppDimensions.largePadding);
    var values = ["1", "2", "3", "4"];
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
            _viewMode = UnitLinkMode.overview1;
            break;
          case 3:
            _viewMode = UnitLinkMode.transactions1;
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
      case UnitLinkMode.overview1:
        return 2;
      case UnitLinkMode.transactions1:
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
