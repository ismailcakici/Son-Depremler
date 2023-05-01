import 'package:go_router/go_router.dart';
import 'package:son_depremler/core/constants/enums/navigation_enums.dart';
import 'package:son_depremler/feature/home/view/home_view.dart';
import 'package:son_depremler/feature/map/view/map_view.dart';

class NavigationManager {
  static NavigationManager? _instance;
  static NavigationManager get instance {
    _instance ??= NavigationManager._init();
    return _instance!;
  }

  NavigationManager._init();
  final router = GoRouter(
    routes: [
      GoRoute(
        path: NavigationEnums.homeView.routeName,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: NavigationEnums.mapView.routeName,
        builder: (context, state) => const MapView(),
      ),
    ],
  );
}
