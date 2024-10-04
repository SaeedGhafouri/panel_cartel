
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/constants/assets.dart';
import 'package:panel_cartel/core/themes/themes.dart';
import 'package:panel_cartel/core/utils/app_routes.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Drawer(
        width: _isExpanded ? 300 : 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: Theme.of(context).cardColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      svg_logo,
                      height: 50,
                    ),
                    const SizedBox(height: 20),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      child: _isExpanded
                          ? Column(
                        children: [
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
                      )
                          : Container(), // Show nothing when collapsed
                    ),
                  ],
                ),
              ),
              ...menuItems(context).map((menu) => buildMenuItem(context, menu)).toList(),
              /*ToggleSwitch(
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
              ),*/
              IconButton(
                icon: Icon(
                  _isExpanded ? IconsaxPlusLinear.arrow_left_1 : IconsaxPlusLinear.arrow_right_3,
                  color: Theme.of(context).textTheme.headlineSmall?.color,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded; // Toggle the expanded state
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, Menu menu) {
    if (menu.children!.isNotEmpty) {
      return ExpansionTile(
        showTrailingIcon: _isExpanded,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
        iconColor: primaryColor,
        textColor: primaryColor,
        backgroundColor: Theme.of(context).cardColor.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        collapsedIconColor: Theme.of(context).iconTheme.color?.withOpacity(0.2),
        title: Row(
          children: [
            Icon(menu.icon, size: 20),
            if (_isExpanded) ...[ // Show name only when expanded
              const SizedBox(width: 10),
              Text(menu.name, style: Theme.of(context).textTheme.bodySmall),
            ],
          ],
        ),
        children: menu.children!.map((child) {
          return ListTile(
            title: Row(
              children: [
                Icon(child.icon, size: 17, color: Theme.of(context).iconTheme.color?.withOpacity(0.2)),
                if (_isExpanded) ...[ // Show child name only when expanded
                  const SizedBox(width: 10),
                  Text(child.name, style: Theme.of(context).textTheme.bodySmall),
                ],
              ],
            ),
            onTap: child.onPress,
          );
        }).toList(),
      );
    } else {
      if (_isExpanded) {
        return ListTile(
          title: Text(menu.name, style: Theme.of(context).textTheme.bodySmall) ,
          leading: Icon(menu.icon, size: 17, color: Theme.of(context).iconTheme.color?.withOpacity(0.2),),
          onTap: menu.onPress,
        );
      }else {
        return ListTile(
          title: Row(
            children: [
              Icon(menu.icon, size: 20),
              if (_isExpanded) ...[ // Show name only when expanded
                const SizedBox(width: 10),
                Text(menu.name, style: Theme.of(context).textTheme.bodySmall),
              ],
            ],
          ),
          onTap: menu.onPress,
        );
      }

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
  /// Dashboard
  Menu(
    id: 1,
    name: 'داشبورد',
    icon: IconsaxPlusLinear.home,
    onPress: () {
      context.go(AppRoutes.dashboard);
    },
  ),
  /// Admins
  Menu(
    id: 2,
    name: 'کارشناسان',
    icon: IconsaxPlusLinear.user_octagon,
    children: [
      Menu(
        id: 3,
        name: 'مدیریت کارشناسان',
        icon: IconsaxPlusLinear.user_add,
        onPress: () {
          context.go('${AppRoutes.admins}');
        },
      ),
      Menu(
        id: 3,
        name: 'افزودن کارشناس',
        icon: IconsaxPlusLinear.user_add,
        onPress: () {
          context.go('${AppRoutes.admins}/${AppRoutes.adminCreate}');
        },
      ),
      Menu(
        id: 5,
        name: 'نقش‌ها و دسترسی‌ها',
        icon: IconsaxPlusLinear.security_user,
        onPress: () {
          context.go('${AppRoutes.admins}/${AppRoutes.adminRoles}');
        },
      ),
    ],
  ),
  /// Users
  Menu(
    id: 2,
    name: 'مشتریان',
    icon: IconsaxPlusLinear.user,
    children: [
      Menu(
        id: 4,
        name: 'مدیریت مشتری',
        icon: IconsaxPlusLinear.user_edit,
        onPress: () {
          context.go(AppRoutes.users);
        },
      ),
      Menu(
        id: 3,
        name: 'افزودن مشتریان',
        icon: IconsaxPlusLinear.user_add,
        onPress: () {
          context.go('${AppRoutes.users}/${AppRoutes.userCreate}');
        },
      ),
    ],
  ),
  /// Products
  Menu(
    id: 6,
    name: 'محصولات',
    icon: IconsaxPlusLinear.box,
    children: [
      Menu(
        id: 8,
        name: 'مدیریت محصولات',
        icon: IconsaxPlusLinear.box,
        onPress: () {
          context.go(AppRoutes.products);
        },
      ),
      Menu(
        id: 7,
        name: 'افزودن محصول',
        icon: IconsaxPlusLinear.box_add,
        onPress: () {
          context.go('${AppRoutes.products}/${AppRoutes.productCreate}');
        },
      ),
      Menu(
        id: 9,
        name: 'دسته‌بندی‌ها',
        icon: IconsaxPlusLinear.category,
        onPress: () {
          context.go(AppRoutes.categories);
        },
      ),
      Menu(
        id: 10,
        name: 'برندها',
        icon: IconsaxPlusLinear.tag,
        onPress: () {
          context.go(AppRoutes.brands);
        },
      ),
    ],
  ),
  /// Orders
  Menu(
    id: 11,
    name: 'سفارشات',
    icon: IconsaxPlusLinear.shopping_cart,
    children: [
      Menu(
        id: 13,
        name: 'مدیریت سفارشات',
        icon: IconsaxPlusLinear.bag_tick,
        onPress: () {
          context.go(AppRoutes.orders);
        },
      ),
    ],
  ),
  /// Settings
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

