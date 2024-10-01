import 'package:go_router/go_router.dart';
import 'package:panel_cartel/features/user/presentation/screens/user_create.dart';
import 'package:panel_cartel/features/user/presentation/screens/user_index.dart';
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
import '../widgets/page_not_found.dart';
import 'app_routes.dart';
class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: AppRoutes.admins,
    routes: <RouteBase>[
      // Auth
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),

      // Overview
      GoRoute(
        path: AppRoutes.dashboard,
        name: '/',
        builder: (context, state) => const DashboardScreen(),
      ),

      // Brands
      GoRoute(
        path: AppRoutes.brands,
        name: 'brands',
        builder: (context, state) => const BrandIndexScreen(),
      ),

      // Admins
      GoRoute(
        path: AppRoutes.admins,
        name: 'admins',
        builder: (context, state) => const AdminIndexScreen(),
        routes: [
          GoRoute(
            path: AppRoutes.adminCreate,
            name: 'adminCreate',
            builder: (context, state) => const AdminCreateScreen(),
          ),
          GoRoute(
            path: AppRoutes.adminDetails,
            name: 'adminDetails',
            builder: (context, state) {
              final adminId = double.tryParse(state.pathParameters['adminId'] ?? '');
              return AdminDetailsScreen(adminId: adminId);
            },
          ),
        ],
      ),

      // Admins
      GoRoute(
        path: AppRoutes.users,
        name: 'users',
        builder: (context, state) => const UserIndexScreen(),
        routes: [
          GoRoute(
            path: AppRoutes.userCreate,
            name: 'userCreate',
            builder: (context, state) => const UserCreateScreen(),
          ),
         /* GoRoute(
            path: AppRoutes.adminDetails,
            name: 'userDetails',
            builder: (context, state) {
              final userId = double.tryParse(state.pathParameters['userId'] ?? '');
              return AdminDetailsScreen(userId: userId);
            },
          ),*/
        ],
      ),

      // Products
      GoRoute(
        path: AppRoutes.products,
        name: 'products',
        builder: (context, state) => const ProductIndexScreen(),
        routes: [
          GoRoute(
            path: AppRoutes.productDetails,
            name: 'productDetails',
            builder: (context, state) {
              final productId = int.tryParse(state.pathParameters['productId'] ?? '');
              return ProductDetailsScreen(productId: productId);
            },
          ),
          GoRoute(
            path: AppRoutes.productCreate,
            name: 'productCreate',
            builder: (context, state) => const ProductCreateScreen(),
          ),
        ],
      ),

      // Orders
      GoRoute(
        path: AppRoutes.orders,
        name: 'orders',
        builder: (context, state) => const OrdersScreen(),
        routes: [
          GoRoute(
            path: AppRoutes.orderDetails,
            name: 'orderDetails',
            builder: (context, state) => const OrderDetailsScreen(),
          ),
        ],
      ),
    ],

    errorBuilder: (context, state) {
      return const PageNotFound(); 
    },
  );
}


