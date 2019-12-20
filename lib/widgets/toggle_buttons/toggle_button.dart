import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theforest/viewmodels/map_activity_vm.dart';
import 'package:theforest/widgets/toggle_buttons/toggle_buttons_mobile.dart';

import '../responsive/screen_type_layout.dart';

class MapToggleButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MapActivityViewModel>(
      builder: (context,model,child)=> ScreenTypeLayout(
        mobile: ToggleButtonsMobile(model.selected),
        
      ),
          
    );
  }
}