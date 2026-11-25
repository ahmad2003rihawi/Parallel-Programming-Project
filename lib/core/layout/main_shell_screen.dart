import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../routing/app_router.gr.dart';
import '../styles/app_colors.dart';
import '../widgets/custom_floating_nav_bar.dart';
import '../widgets/custom_floating_nav_bar_enum.dart';

@RoutePage()
class MainShellScreen extends StatelessWidget {
  const MainShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        MyBookingsRoute(),
        MyFavoritesRoute(),
        MyAccountRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        final itemCount = 4; // عدد التبويبات الفعلية في routes
        final activeIndex = tabsRouter.activeIndex.clamp(0, itemCount - 1);

        return Scaffold(
          extendBody: true,
          body: child,
          bottomNavigationBar: CustomFloatingNavBar(
            currentIndex: activeIndex,
            onTap: (index) {
              if (index < tabsRouter.pageCount) {
                tabsRouter.setActiveIndex(index);
              }
            },
            horizontalMargin: 16,
            height: 60,
            borderRadius: 15,
            backgroundColor: AppColors.secondary,
            borderColor: AppColors.white.withValues(alpha: 0.16),
            glowColor: AppColors.primary,
            glowWidth: MediaQuery.sizeOf(context).width * 0.35,
            glowPosition: NavGlowPosition.bottom,
            glowStyle: NavGlowStyle.glow,
            items: [
              FloatingNavItem(
                child: const SizedBox.shrink(),
                builder: (context, isSelected) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isSelected ? Icons.home : Icons.home_outlined,
                      color: AppColors.thirdColor,
                      size: 20,
                    ),
                    if (isSelected) ...[
                      const SizedBox(height: 2),
                      const Text(
                        'Home',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.thirdColor,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              FloatingNavItem(
                child: const SizedBox.shrink(),
                builder: (context, isSelected) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isSelected ? Icons.luggage : Icons.luggage_outlined,
                      color: AppColors.thirdColor,
                      size: 20,
                    ),
                    if (isSelected) ...[
                      const SizedBox(height: 2),
                      const Text(
                        'Bookings',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.thirdColor,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              FloatingNavItem(
                child: const SizedBox.shrink(),
                builder: (context, isSelected) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isSelected ? Icons.favorite : Icons.favorite_border,
                      color: AppColors.thirdColor,
                      size: 20,
                    ),
                    if (isSelected) ...[
                      const SizedBox(height: 2),
                      const Text(
                        'Favorites',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.thirdColor,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              FloatingNavItem(
                child: const SizedBox.shrink(),
                builder: (context, isSelected) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isSelected ? Icons.person : Icons.person_outline,
                      color: AppColors.thirdColor,
                      size: 20,
                    ),
                    if (isSelected) ...[
                      const SizedBox(height: 2),
                      const Text(
                        'Account',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.thirdColor,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
