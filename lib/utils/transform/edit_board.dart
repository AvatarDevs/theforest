
import 'package:flutter/material.dart';
import 'package:theforest/utils/transform/board.dart';
import 'package:theforest/utils/transform/colorpicker.dart';


// The panel for editing a board point.
@immutable
class EditBoardPoint extends StatelessWidget {
  const EditBoardPoint({
    Key key,
    @required this.boardPoint,
    this.onColorSelection,
  }) : assert(boardPoint != null),
       super(key: key);

  final BoardPoint boardPoint;
  final ValueChanged<Color> onColorSelection;

  @override
  Widget build (BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          '${boardPoint.q}, ${boardPoint.r}',
          textAlign: TextAlign.right,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        ColorPicker(
          colors: boardPointColors,
          selectedColor: boardPoint.color,
          onColorSelection: onColorSelection,
        ),
      ],
    );
  }
}