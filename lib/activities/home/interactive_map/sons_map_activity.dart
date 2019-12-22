import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class RectsExample extends StatefulWidget {
  @override
  _RectsExampleState createState() => _RectsExampleState();
}

class _RectsExampleState extends State<RectsExample> {
  int _index = -1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Rects(
      rects: [
        Rect.fromLTWH(20, 0, 30, 40),
        Rect.fromLTWH(100,250, 150, 200),
        Rect.fromLTWH(75, 500, 30, 40),
        Rect.fromLTWH(3000, 0, 150, 200),
      ],
      selectedIndex: _index,
      onSelected: (index,rects) {
        setState(() {
          _index = index;
        });
        showModalBottomSheet(context: context, builder: (context)=> Container(
          width:150,height:200,
          child: Center(child:Text(rects[index].height.toString()) ,),
        ));
      },
          ),
        ),
    );
  }
}

class Rects extends StatelessWidget {
  final List<Rect> rects;
  final void Function(int, List<Rect>) onSelected;
  final int selectedIndex;

  const Rects({
    Key key,
    @required this.rects,
    @required this.onSelected,
    this.selectedIndex = -1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhotoView.customChild(
      minScale: PhotoViewComputedScale.contained,
      maxScale: PhotoViewComputedScale.covered*2,
      
      onTapDown: (context,details,controller){
       
        //print((controller.position/controller.scale));
        print(controller.scale);
         
         double scaler = 4096/MediaQuery.of(context).size.width;
         Offset div = (controller.position/controller.scale);
         
      RenderBox box = context.findRenderObject();
      //print(box.getMaxIntrinsicHeight(4096));
      final offset = box.localToGlobal(details.globalPosition);
      final index = rects.lastIndexWhere((rect) => rect.contains(offset));

    
      Offset pos = Offset((offset.dx*scaler)*controller.scale, (offset.dy*scaler)*controller.scale);
      print((pos));
      if (index != -1) {
        onSelected(index,rects);
        return;
      }

      },
      childSize: Size(4096  ,4096),
          child: Container(color: Colors.orange,
            child: CustomPaint(
            size: Size(4096, 4096),
            painter: _RectPainter(rects, selectedIndex),
        ),
          ),
    );
  }
}

class _RectPainter extends CustomPainter {
  static Paint _red = Paint()..color = Colors.red;
  static Paint _blue = Paint()..color = Colors.blue;

  final List<Rect> rects;
  final int selectedIndex;

  _RectPainter(this.rects, this.selectedIndex);

  @override
  void paint(Canvas canvas, Size size) {
    var i = 0;
    for (Rect rect in rects) {
      canvas.drawRect(rect, i++ == selectedIndex ? _red : _blue);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}