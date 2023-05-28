import 'package:go_router/go_router.dart';

abstract class NavigationBase {
  Iterable<RouteBase> getRoutes();
}