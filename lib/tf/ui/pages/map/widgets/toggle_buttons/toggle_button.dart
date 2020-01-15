import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theforest/shared/responsive/screen_type_layout.dart';
import 'package:theforest/tf/ui/pages/map/widgets/toggle_buttons/toggle_buttons_mobile.dart';
import 'package:theforest/tf/viewmodels/map_activity_vm.dart';

class MapToggleButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MapActivityViewModel>(
      builder: (context, model, child) => ScreenTypeLayout(
        mobile: ToggleButtonsMobile(model.selected),
      ),
    );
  }
}
