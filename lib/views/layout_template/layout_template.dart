import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wa2telegram/locator.dart';
import 'package:wa2telegram/routing/route_names.dart';
import 'package:wa2telegram/routing/router.dart';
import 'package:wa2telegram/services/navigation_service.dart';
import 'package:wa2telegram/widgets/centered_view/centered_view.dart';
import 'package:wa2telegram/widgets/navigation_bar/navigation_bar.dart';
import 'package:wa2telegram/widgets/navigation_drawer/navigation_drawer.dart';

class LayoutTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? NavigationDrawer()
            : null,
        backgroundColor: Colors.white,
        body: CenteredView(
          child: Column(
            children: <Widget>[
              NavigationBar(),
              Expanded(
                child: Navigator(
                  key: locator<NavigationService>().navigatorKey,
                  onGenerateRoute: generateRoute,
                  initialRoute: HomeRoute,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
