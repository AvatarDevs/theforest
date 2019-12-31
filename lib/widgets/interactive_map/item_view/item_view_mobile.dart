import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:photo_view/photo_view.dart';
import 'package:theforest/models/map_item.dart';
import 'package:theforest/widgets/interactive_map/item_view/item_view.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;

class ItemViewMobile extends StatelessWidget {
  final MapItemModel model;

  const ItemViewMobile({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: SafeArea(
              child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.none,
                background: GuideDetailsHeading(
                  title: model.title,
                  subtitle: model.decription,
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
                //  _htmtoWidget(model.content, context),
                 Text(model.locationDescription)
                ]),
              )

          ],
        ),
      ),
    );
  }


  Widget _htmtoWidget(String html, BuildContext contexts) {
    return Container(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 700),
        child: Html(
          padding: const EdgeInsets.all(10),
          //useRichText: true,
          onImageTap: (string) {
            print('ImageTapped\n');
            showDialog(
                context: contexts,
                builder: (c) {
                  return Scaffold(
                    appBar: AppBar(),
                    body: PhotoView(
                      loadingChild: Center(child: CircularProgressIndicator()),
                      imageProvider: NetworkImage(string),
                      minScale: PhotoViewComputedScale.contained * .8,
                      maxScale: PhotoViewComputedScale.covered * 2,
                      enableRotation: true,
                    ),
                  );
                });
          },
          onLinkTap: (url) {
            print(url);
            _launchURL(url);
          },
          //defaultTextStyle: TextStyle(color: Colors.indigo),

          //padding: const EdgeInsets.all(60),
          data: html,
        ),
      ),
    );
  }


  void _launchURL(String url) async {
    if (url == '' || url == null) {
      print("no url provided");
      return;
    }
    if (kIsWeb) {
      html.window.open(url, '');
      return;
    }
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
