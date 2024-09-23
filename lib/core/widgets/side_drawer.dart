
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/constants/assets.dart';
import 'package:panel_cartel/core/themes/themes.dart';
import 'package:panel_cartel/features/admin/presentation/screens/admin_create_screen.dart';
import 'package:panel_cartel/features/admin/presentation/screens/admin_index_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../themes/theme_bloc.dart';
import '../themes/theme_event.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: Theme.of(context).cardColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      svg_logo,
                      height: 50,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'کارتل ویژن',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'نسخه 4.1.7',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              ...menuItems(context).map((menu) => buildMenuItem(context, menu)).toList(),
              ToggleSwitch(
                minWidth: 80.0,
                minHeight: 30,
                cornerRadius: 20.0,
                radiusStyle: true,
                animationDuration: 100,
                animate: true,
                activeBgColors: [
                  [Theme.of(context).primaryColor],
                  [Theme.of(context).primaryColor]
                ],
                activeFgColor: Colors.white,
                inactiveFgColor: Theme.of(context).dividerColor,
                inactiveBgColor: Theme.of(context).dividerColor.withOpacity(0.2),
                initialLabelIndex: Theme.of(context).brightness == Brightness.light ? 0 : 1,
                totalSwitches: 2,
                customTextStyles: const [
                  TextStyle(
                    fontSize: 12,
                  ),
                ],
                iconSize: 17,
                labels: const [' روشن', ' تیره'],
                icons: [IconsaxPlusLinear.sun_1, IconsaxPlusLinear.moon],
                onToggle: (index) {
                  BlocProvider.of<ThemeBloc>(context).add(ToggleThemeEvent());
                },
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget buildMenuItem(BuildContext context, Menu menu) {
    if (menu.children!.isNotEmpty) {
      return ExpansionTile(
        childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
        iconColor: primaryColor,
        textColor: primaryColor,
        backgroundColor: Theme.of(context).cardColor.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        collapsedIconColor: Theme.of(context).iconTheme.color?.withOpacity(0.2),
        title: Text(menu.name, style: Theme.of(context).textTheme.bodySmall),
        leading: Icon(menu.icon, size: 20),
        children: menu.children!
            .map(
              (child) => ListTile(
            title: Text(child.name,
                style: Theme.of(context).textTheme.bodySmall),
            leading: Icon(child.icon, size: 17,color: Theme.of(context).iconTheme.color?.withOpacity(0.2)),
            onTap: child.onPress,
          ),
        )
            .toList(),
      );
    } else {
      return ListTile(
        title: Text(menu.name, style: Theme.of(context).textTheme.bodySmall),
        leading: Icon(menu.icon, size: 17, color: Theme.of(context).iconTheme.color?.withOpacity(0.2),),
        onTap: menu.onPress,
      );
    }
  }
}

class Menu {
  final int id;
  final String name;
  final int? parentId;
  final IconData? icon;
  final VoidCallback? onPress;
  final List<Menu>? children;

  Menu({
    required this.id,
    required this.name,
    this.parentId,
    this.icon,
    this.onPress,
    this.children = const [],
  });
}

List<Menu> menuItems(BuildContext context) => [
  Menu(
    id: 1,
    name: 'داشبورد',
    icon: IconsaxPlusLinear.home,
    onPress: () {
      // Navigate to Dashboard
    },
  ),
  Menu(
    id: 2,
    name: 'کارشناسان',
    icon: IconsaxPlusLinear.user_octagon,
    children: [
      Menu(
        id: 3,
        name: 'افزودن کارشناس',
        icon: IconsaxPlusLinear.user_add,
        onPress: () {
          // Navigate to Add User
        },
      ),
      Menu(
        id: 3,
        name: 'مدیریت کارشناسان',
        icon: IconsaxPlusLinear.user_add,
        onPress: () {
          GoRouter.of(context).goNamed('admins');
        },
      ),
      Menu(
        id: 5,
        name: 'نقش‌ها و دسترسی‌ها',
        icon: IconsaxPlusLinear.security_user,
        onPress: () {
          // Navigate to Roles and Permissions
        },
      ),
    ],
  ),
  Menu(
    id: 2,
    name: 'مشتریان',
    icon: IconsaxPlusLinear.user,
    children: [
      Menu(
        id: 3,
        name: 'افزودن مشتریان',
        icon: IconsaxPlusLinear.user_add,
        onPress: () {
          // Navigate to Add User
        },
      ),
      Menu(
        id: 4,
        name: 'مدیریت مشتری',
        icon: IconsaxPlusLinear.user_edit,
        onPress: () {
          // Navigate to Manage Users
        },
      ),
    ],
  ),
  Menu(
    id: 6,
    name: 'محصولات',
    icon: IconsaxPlusLinear.box,
    children: [
      Menu(
        id: 7,
        name: 'افزودن محصول',
        icon: IconsaxPlusLinear.box_add,
        onPress: () {
          GoRouter.of(context).go('/products/productCreate');
        },
      ),
      Menu(
        id: 8,
        name: 'مدیریت محصولات',
        icon: IconsaxPlusLinear.box,
        onPress: () {
          GoRouter.of(context).goNamed('products');
        },
      ),
      Menu(
        id: 9,
        name: 'دسته‌بندی‌ها',
        icon: IconsaxPlusLinear.category,
        onPress: () {
          // Navigate to Categories
        },
      ),
      Menu(
        id: 10,
        name: 'برچسب‌ها',
        icon: IconsaxPlusLinear.tag,
        onPress: () {
          // Navigate to Tags
        },
      ),
    ],
  ),
  Menu(
    id: 11,
    name: 'سفارشات',
    icon: IconsaxPlusLinear.shopping_cart,
    children: [
      Menu(
        id: 12,
        name: 'سفارشات جدید',
        icon: IconsaxPlusLinear.bag_2,
        onPress: () {
          GoRouter.of(context).go('orders');
        },
      ),
      Menu(
        id: 13,
        name: 'مدیریت سفارشات',
        icon: IconsaxPlusLinear.bag_tick,
        onPress: () {
          // Navigate to Manage Orders
        },
      ),
      Menu(
        id: 14,
        name: 'پیگیری سفارشات',
        icon: IconsaxPlusLinear.bag_cross,
        onPress: () {
          // Navigate to Order Tracking
        },
      ),
    ],
  ),
  Menu(
    id: 15,
    name: 'گزارشات',
    icon: IconsaxPlusLinear.diagram,
    children: [
      Menu(
        id: 16,
        name: 'گزارش فروش',
        icon: IconsaxPlusLinear.chart,
        onPress: () {
          // Navigate to Sales Report
        },
      ),
      Menu(
        id: 17,
        name: 'گزارش محصولات',
        icon: IconsaxPlusLinear.chart_square,
        onPress: () {
          // Navigate to Product Report
        },
      ),
      Menu(
        id: 18,
        name: 'گزارش کاربران',
        icon: IconsaxPlusLinear.chart,
        onPress: () {
          // Navigate to User Report
        },
      ),
    ],
  ),
  Menu(
    id: 19,
    name: 'تنظیمات',
    icon: IconsaxPlusLinear.setting_2,
    children: [
      Menu(
        id: 20,
        name: 'تنظیمات فروشگاه',
        icon: IconsaxPlusLinear.shop,
        onPress: () {
          // Navigate to Store Settings
        },
      ),
      Menu(
        id: 21,
        name: 'پرداخت‌ها',
        icon: IconsaxPlusLinear.wallet_2,
        onPress: () {
          // Navigate to Payment Settings
        },
      ),
      Menu(
        id: 22,
        name: 'پیام‌ها',
        icon: IconsaxPlusLinear.message,
        onPress: () {
          // Navigate to Messages Settings
        },
      ),
      Menu(
        id: 23,
        name: 'پشتیبانی',
        icon: IconsaxPlusLinear.support,
        onPress: () {
          // Navigate to Support Settings
        },
      ),
    ],
  ),
];

