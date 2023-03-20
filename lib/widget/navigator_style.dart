import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:huixinapp/app/const/color.dart';
import 'package:huixinapp/screen/home/home_ui.dart';
import 'package:huixinapp/screen/profile/profile_ui.dart';
import 'package:huixinapp/screen/reporting/reporting_detail_ui.dart';
import 'package:huixinapp/widget/pageroute.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({super.key});

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];

      switch (_selectedTab) {
        case _SelectedTab.home:
          Navigator.push(
              context, FadePageRoute(builder: (context) => const HomePage()));
          break;

        case _SelectedTab.reporting:
          Navigator.pushNamed(context, '/reporting');

          break;
        case _SelectedTab.profile:
          Navigator.push(context,
              FadePageRoute(builder: (context) => const ProfilePage()));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: DotNavigationBar(
        dotIndicatorColor: AppColors.bottom,
        marginR: const EdgeInsets.symmetric(horizontal: 40, vertical: 1),
        paddingR: const EdgeInsets.symmetric(horizontal: 80, vertical: 5),
        enableFloatingNavBar: true,
        borderRadius: 15,
        backgroundColor: AppColors.bottom,
        onTap: _handleIndexChanged,

        // dotIndicatorColor: Colors.black,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
            unselectedColor: Colors.white,
            selectedColor: Colors.white,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.bullseye),
            // selectedColor: Colors.white,
            unselectedColor: Colors.white,
          ),

          /// Search
          DotNavigationBarItem(
            icon: const Icon(Icons.people),
            // selectedColor: Colors.white,
            unselectedColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

enum _SelectedTab { home, reporting, profile }
