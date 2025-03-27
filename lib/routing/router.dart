import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/routing/routes.dart';
import 'package:flutter_clean_arch/ui/home/home_page.dart';
import 'package:flutter_clean_arch/ui/home/view_models/home_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter _router = GoRouter(
    navigatorKey: _navigatorKey,
    initialLocation: Routes.home,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) {
          return ChangeNotifierProvider<HomeViewModel>(
            create: (context) {
              final viewModel = HomeViewModel(
                getAddressUseCase: context.read(),
              );

              return viewModel;
            },
            child: HomePage(),
          );
        },
      ),
    ],
  );

  GoRouter get router => _router;
}
