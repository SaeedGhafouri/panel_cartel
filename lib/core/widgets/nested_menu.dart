import 'package:flutter/material.dart';
import 'package:panel_cartel/core/widgets/side_drawer.dart';

class NestedMenu extends StatelessWidget {
  final List<Menu> menuItems;

  const NestedMenu({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: _buildMenuItems(menuItems, context),
    );
  }

  List<Widget> _buildMenuItems(List<Menu> items, BuildContext context) {
    return items.map((item) {
      if (item.children != null && item.children!.isNotEmpty) {
        return ExpansionTile(
          title: Text(
            item.name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          leading: item.icon != null ? Icon(item.icon) : null,  // نمایش آیکون
          children: _buildMenuItems(item.children!, context),
        );
      } else {
        return ListTile(
          title: Text(
            item.name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          leading: item.icon != null ? Icon(item.icon) : null,  // نمایش آیکون
          onTap: item.onPress,
        );
      }
    }).toList();
  }
}
