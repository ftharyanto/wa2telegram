import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wa2telegram/widgets/centered_view/centered_view.dart';
import 'package:wa2telegram/widgets/navigation_bar/navigation_bar.dart';
import 'package:wa2telegram/widgets/navigation_drawer/navigation_drawer.dart';

import 'home_content_desktop.dart';
import 'home_content_mobile.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TO DO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
            drawer:
                sizingInformation.deviceScreenType == DeviceScreenType.mobile
                    ? NavigationDrawer()
                    : null,
            backgroundColor: Colors.white,
            body: CenteredView(
              child: Column(
                children: <Widget>[
                  NavigationBar(),
                  Expanded(
                      child: ScreenTypeLayout(
                    mobile: HomeContentMobile(),
                    desktop: HomeContentDesktop(),
                  ))
                ],
              ),
            )));
  }
}
