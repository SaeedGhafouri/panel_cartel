import 'package:go_router/go_router.dart';
import 'package:panel_cartel/features/admin/presentation/screens/admin_role_screen.dart';
import 'package:panel_cartel/features/user/presentation/screens/user_create.dart';
import 'package:panel_cartel/features/user/presentation/screens/user_index_screen.dart';
import '../../features/admin/presentation/screens/admin_create_screen.dart';
import '../../features/admin/presentation/screens/admin_details_screen.dart';
import '../../features/admin/presentation/screens/admin_index_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/brand/presentation/screens/brand_index_screen.dart';
import '../../features/category/presentation/screens/category_index.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/order/presentation/screens/order_details_screen.dart';
import '../../features/order/presentation/screens/orders_screen.dart';
import '../../features/product/presentation/screens/product_create.dart';
import '../../features/product/presentation/screens/product_details_screen.dart';
import '../../features/product/presentation/screens/product_index.dart';
import '../../features/user/presentation/screens/user_details_screen.dart';
import '../widgets/page_not_found.dart';
import 'app_routes.dart';
class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: AppRoutes.brands,
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
      GoRoute(
        path: AppRoutes.categories,
        name: 'categories',
        builder: (context, state) => const CategoryIndexScreen(),
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
              final adminId = int.tryParse(state.pathParameters['adminId'] ?? '0');
              return AdminDetailsScreen(adminId: adminId);
            },
          ),
          GoRoute(
            path: AppRoutes.adminRoles,
            name: 'adminRoles',
            builder: (context, state) => const AdminRoleScreen(),
          ),
        ],
      ),
      // Users
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
          GoRoute(
            path: AppRoutes.userDetails,
            name: 'userDetails',
            builder: (context, state) {
              final userId = int.tryParse(state.pathParameters['userId'] ?? '0');
              return UserDetailsScreen(userId: userId);
            },
          ),
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
              final productId = int.tryParse(state.pathParameters['productId'] ?? '0');
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


