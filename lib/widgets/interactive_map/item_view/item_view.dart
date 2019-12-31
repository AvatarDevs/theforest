import 'package:flutter/material.dart';
import 'package:theforest/models/map_item.dart';
import 'package:theforest/widgets/interactive_map/item_view/item_view_desktop.dart';
import 'package:theforest/widgets/interactive_map/item_view/item_view_mobile.dart';
import 'package:theforest/widgets/responsive/screen_type_layout.dart';

class ItemView extends StatelessWidget {
  final MapItemModel model;

  const ItemView({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ItemViewMobile(model: model),
      //desktop: ItemViewDesktop(model),
    );
  }
}

class GuideDetailsHeading extends StatelessWidget {
  final String title;
  final String subtitle;
  final String url;
  final void Function(String) callback;

  const GuideDetailsHeading({
    Key key,
    this.title,
    this.subtitle,
    this.callback,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title ?? "",
          style: Theme.of(context).textTheme.headline,
        ),
        Text(
          subtitle ?? "",
          style: Theme.of(context).textTheme.subtitle,
        ),
        Padding(
          padding: EdgeInsets.all(5),
        ),
        getPlayButton(),
      ],
    );
  }

  getPlayButton() {
    if (url == null || url == '') {
      return Container();
    } else {
      return FlatButton(
        child: Text("PLAY VIDEO", style: TextStyle(color: Colors.blue)),
        onPressed: callback != null
            ? () {
                callback(url);
              }
            : null,
      );
    }
  }
}
