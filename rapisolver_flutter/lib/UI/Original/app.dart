import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/UI/Original/bottom_navigation.dart';
import 'package:rapisolver_flutter/UI/Original/tab_navigator.dart';


class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  TabItem _currentTab = TabItem.miPerfil;
  

  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.miPerfil: GlobalKey<NavigatorState>(),
    TabItem.buscarServicios: GlobalKey<NavigatorState>(),
    TabItem.buscarProveedor: GlobalKey<NavigatorState>(),
    TabItem.misReservas: GlobalKey<NavigatorState>()
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.miPerfil) {
            // select 'main' tab
            _selectTab(TabItem.miPerfil);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.miPerfil),
          _buildOffstageNavigator(TabItem.buscarServicios),
          _buildOffstageNavigator(TabItem.buscarProveedor),
          _buildOffstageNavigator(TabItem.misReservas)
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
