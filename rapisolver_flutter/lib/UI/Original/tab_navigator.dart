import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/UI/Original/bottom_navigation.dart';
import 'package:rapisolver_flutter/UI/Original/controlador_vistas.dart';


class TabNavigatorRoutes {
  static const String root = '/';

}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;



  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex: 500}) {
    return {
      TabNavigatorRoutes.root: (context) => ControladorVistas(title: tabName[tabItem]),
     
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
