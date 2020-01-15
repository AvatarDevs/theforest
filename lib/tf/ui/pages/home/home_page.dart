import 'package:flutter/material.dart';
import 'package:theforest/shared/responsive/screen_type_layout.dart';
import 'package:theforest/shared/responsive/size_restriction.dart';
import 'package:theforest/tf/ui/pages/home/widgets/home_choice.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: HomeMobile(),
    );
  }
}




class HomeMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "assets/forestbg.jpg",
                fit: BoxFit.cover,
              )),
          Center(
            child: WidthRestriction(
              child: HomeGameChoices(),
            ),
          ),
        ],
      ),
    );
  }
}
