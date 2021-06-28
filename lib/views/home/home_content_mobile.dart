import 'package:flutter/material.dart';
import 'package:wa2telegram/widgets/user_input/user_input_mobile.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        UserInputMobile(),
      ],
    );
  }
}
