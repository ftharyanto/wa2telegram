import 'package:flutter/material.dart';
import 'package:wa2telegram/widgets/user_input/user_input_desktop.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Center(
          child: UserInputDesktop(),
        ),
      )
    ]);
  }
}
