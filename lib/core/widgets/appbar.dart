import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/utils/app_routes.dart';
import 'package:panel_cartel/core/widgets/profile_popup_widget.dart';
import 'package:shamsi_date/shamsi_date.dart';
import '../../features/auth/logic/storage/expert/expert_preferences.dart';
import '../themes/themes.dart';

class AppBarMain extends StatelessWidget {

  final role = 'مدیرعامل';

  const AppBarMain({super.key});

  Future<String> getImageUrl() async {
    String? imageUrl = await ExpertPreferences.getImageUrl();
    return imageUrl!;
  }

  Future<String> getFullName() async {
    String? firstName = await ExpertPreferences.getFirstName();
    String? lastName = await ExpertPreferences.getLastName();
    return '$firstName $lastName';
  }

  @override
  Widget build(BuildContext context) {
    Jalali jDate = Jalali.now();
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: containerHorizontal, vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                FutureBuilder<String>(
                  future: getFullName(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Text('Error');
                    } else {
                      return FutureBuilder<String>(
                        future: getImageUrl(),
                        builder: (context, imageSnapshot) {
                          if (imageSnapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (imageSnapshot.hasError) {
                            return const Text('Error');
                          } else {
                            return ProfilePopupWidget(
                              id: 1,
                              username: snapshot.data ?? 'No Name',
                              role: role,
                              imageUrl: imageSnapshot.data ?? '',
                            );
                          }
                        },
                      );
                    }
                  },
                ),
                const SizedBox(width: spacingSmall,),
                Container(
                  width: 1,
                  height: 40,
                  color: Theme.of(context).dividerColor,
                ),
                const SizedBox(width: spacingThin,),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(IconsaxPlusLinear.notification, size: 18),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(IconsaxPlusLinear.activity, size: 18),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(IconsaxPlusLinear.calendar, size: 18),
                ),
                Text(
                  '${jDate.formatter.wN} ${jDate.day}/${jDate.formatter.mN}/${jDate.year}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.go(AppRoutes.dashboard);
                  },
                  icon: Icon(IconsaxPlusLinear.home_2, size: 17,),
                ),

                IconButton(
                  icon: const Icon(IconsaxPlusLinear.menu),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


