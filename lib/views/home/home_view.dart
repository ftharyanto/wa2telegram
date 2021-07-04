import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
    return ScreenTypeLayout(
      mobile: HomeContentMobile(),
      desktop: HomeContentDesktop(),
    );
  }
}
