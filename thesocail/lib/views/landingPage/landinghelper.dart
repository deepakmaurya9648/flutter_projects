import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class LandingHelpers with ChangeNotifier {
  Widget bodyImage(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('bodyImage.png'))),
    );
  }
}
