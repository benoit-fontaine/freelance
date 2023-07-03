import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

abstract class ModuleBase {
  void setupInjection(GetIt instance);
  Iterable<RouteBase> getRoutes();
}
