import 'package:clean_architeture_flutter/features/presenter/modules/drawer/drawer.module.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/pages/home_page.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/pages/search_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  final List<Bind> binds = [
    Bind.factory((i) => HomeModule()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, __) => const HomePage(),
          transition: TransitionType.leftToRight,
        ),
        ChildRoute(
          "/search",
          child: (_, __) => const SearchPage(),
          transition: TransitionType.leftToRight,
        ),
        ModuleRoute("/drawer", module: DrawerModule())
      ];
}
