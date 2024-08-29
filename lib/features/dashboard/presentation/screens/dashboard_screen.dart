import 'package:flutter/material.dart';
import 'package:panel_cartel/features/admin/presentation/screens/admin_create_screen.dart';
import 'package:panel_cartel/features/admin/presentation/screens/admin_details_screen.dart';
import 'package:panel_cartel/features/admin/presentation/screens/admin_index_screen.dart';
import 'package:panel_cartel/features/dashboard/presentation/widgets/appbar.dart';
import '../widgets/side_drawer.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    AdminIndexScreen()
  ];

  void _onDrawerItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Builder(
            builder: (context) => AppBarMain(
              onMenuPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
      // Drawer
      endDrawer: SideDrawer(onTap: _onDrawerItemTapped),
    );
  }
}
