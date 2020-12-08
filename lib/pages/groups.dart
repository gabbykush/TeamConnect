import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamconnect/Widgets/add_another_button.dart';
import 'package:teamconnect/Widgets/icon_large_button.dart';
import 'package:teamconnect/Widgets/ui_components.dart';
import 'package:teamconnect/general/resources/app_themes.dart';
import 'package:teamconnect/general/resources/dimension.dart';
import 'package:teamconnect/general/resources/routes.dart';
import 'package:teamconnect/general/styles/colors.dart';
import 'package:teamconnect/providers/general.dart';

class GroupsPage extends StatefulWidget {
  @override
  _GroupsPageState createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  ViewMode _viewMode = ViewMode.classes;
  List<IconLargeButton> _groups = List<IconLargeButton>();
  List<IconLargeButton> _groupsForDisplay = List<IconLargeButton>();

  @override
  Widget build(BuildContext context) {
    return Consumer<General>(builder: (context, store, child) {
      return Container(
          decoration: BoxDecoration(color: AppColors.primaryAccent),
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
                  SizedBox(height: AppDimensions.cardsSpacing),
                  _searchBar(),
                  SizedBox(height: AppDimensions.cardsSpacing),
                  _buildToggleSelector(),
                  SizedBox(height: AppDimensions.cardsSpacing),
                  Visibility(
                    visible: _viewMode == ViewMode.classes,
                    child: _buildOverviewSection(),
                  ),
                  Visibility(
                    visible: _viewMode == ViewMode.clubs,
                    child: _buildTransactionSection(),
                  ),
                  Visibility(
                    visible: _viewMode == ViewMode.national,
                    child: _buildOverview1Section(),
                  ),
                  Visibility(
                    visible: _viewMode == ViewMode.international,
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
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Padding(
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
      ),
    );
  }

  _buildOverviewSection() {
    return Container(
        child: Column(
      children: [
        IconLargeButton(
          title: "Chem Class",
          onPressed: () {
            Navigator.pushNamed(context, Routes.chatScreen);
          },
          icon: Icon(Icons.group),
        ),
        SizedBox(height: AppDimensions.cardsSpacing),
        IconLargeButton(
          title: "Bio class",
          onPressed: null,
          icon: Icon(Icons.group),
        ),
        SizedBox(height: AppDimensions.cardsSpacing),
        IconLargeButton(
          title: "Comp Sci class",
          onPressed: null,
          icon: Icon(Icons.group),
        ),
        SizedBox(height: AppDimensions.cardsSpacing),
        IconLargeButton(
          title: "Math 310 class",
          onPressed: null,
          icon: Icon(Icons.group),
        ),
        SizedBox(height: AppDimensions.cardsSpacing),
        IconLargeButton(
          title: "Architecture class",
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
      children: [
        IconLargeButton(
          title: "Chem Class",
          onPressed: () {
            Navigator.pushNamed(context, Routes.chatScreen);
          },
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

  _buildOverview1Section() {
    return Container(
        child: Column(
      children: [
        IconLargeButton(
            icon: Icon(Icons.group), title: "Group 3", onPressed: null),
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

  _buildTransaction1Section() {
    return Container(
        child: Column(
      children: [
        IconLargeButton(
          title: "Group 4",
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

  _buildToggleSelector() {
    var generalProvider = Provider.of<General>(context, listen: false);

    var width =
        (MediaQuery.of(context).size.width - 2 * AppDimensions.largePadding);
    var values = ["1", "2", "3", "4"];
    return buildToggleGroup(
        generalProvider, toggleSelectedIndex(), values, width, (value) {
      setState(() {
        switch (value) {
          case 0:
            _viewMode = ViewMode.classes;
            break;
          case 1:
            _viewMode = ViewMode.clubs;
            break;
          case 2:
            _viewMode = ViewMode.national;
            break;
          case 3:
            _viewMode = ViewMode.international;
            break;
          default:
            break;
        }
      });
    });
  }

  int toggleSelectedIndex() {
    switch (_viewMode) {
      case ViewMode.classes:
        return 0;
      case ViewMode.clubs:
        return 1;
      case ViewMode.national:
        return 2;
      case ViewMode.international:
        return 3;
      default:
        return 0;
    }
  }
}

enum ViewMode { classes, clubs, national, international }
