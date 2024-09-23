import 'package:go_router/go_router.dart';

import '../../features/admin/presentation/screens/admin_create_screen.dart';
import '../../features/admin/presentation/screens/admin_details_screen.dart';
import '../../features/admin/presentation/screens/admin_index_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/brand/presentation/screens/brand_index.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/order/presentation/screens/order_details_screen.dart';
import '../../features/order/presentation/screens/orders_screen.dart';
import '../../features/product/presentation/screens/product_create.dart';
import '../../features/product/presentation/screens/product_details_screen.dart';
import '../../features/product/presentation/screens/product_index.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/createProduct',
    routes: <RouteBase>[
      // Auth
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),

      // Overview
      GoRoute(
        path: DashboardScreen.routeName,
        name: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),

      // Brands
      GoRoute(
        path: '/brands',
        name: 'brands',
        builder: (context, state) => const BrandIndexScreen(),
      ),

      // Admins
      GoRoute(
        path: AdminIndexScreen.routeName,
        name: 'admins',
        builder: (context, state) => const AdminIndexScreen(),
        routes: [
          GoRoute(
            path: AdminCreateScreen.routeName,
            builder: (context, state) => const AdminCreateScreen(),
          ),
          GoRoute(
            path: 'adminDetails/:adminId',
            builder: (context, state) {
              final adminId = double.tryParse(state.pathParameters['adminId'] ?? '');
              return AdminDetailsScreen(adminId: adminId);
            },
          ),
        ],
      ),

      // Products
      GoRoute(
        path: '/products',
        name: 'products',
        builder: (context, state) => const ProductIndexScreen(),
        routes: [
          GoRoute(
            path: 'productDetails/:productId',
            builder: (context, state) {
              final productId = int.tryParse(state.pathParameters['productId'] ?? '');
              return ProductDetailsScreen(productId: productId);
            },
          ),
          GoRoute(
            path: 'productCreate',
            builder: (context, state) => const ProductCreateScreen(),
          ),
        ],
      ),

      // Orders
      GoRoute(
        path: '/orders',
        name: 'orders',
        builder: (context, state) => const OrdersScreen(),
        routes: [
          GoRoute(
            path: 'orderDetails',
            builder: (context, state) => OrderDetailsScreen(),
          ),
        ],
      ),
    ],
  );
}
