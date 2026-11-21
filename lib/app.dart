import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'core/di/injection.dart';
import 'core/theme/app_colors.dart';
import 'features/portfolio/presentation/controllers/portfolio_controller.dart';
import 'features/portfolio/presentation/pages/home_page.dart';

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  late final PortfolioController _controller = buildPortfolioController()..load();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Ahmed | Flutter developer',
        debugShowCheckedModeBanner: false,
        scrollBehavior: const _DragEverywhere(),
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: AppColors.blue,
          scaffoldBackgroundColor: AppColors.paper,
        ),
        home: HomePage(controller: _controller),
      );
}

class _DragEverywhere extends MaterialScrollBehavior {
  const _DragEverywhere();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus,
      };
}
