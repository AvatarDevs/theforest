import 'package:flutter/material.dart';
import 'package:theforest/tf/ui/pages/map/map_page.dart';
class HomeGameChoices extends StatefulWidget  {
  @override
  _HomeGameChoicesState createState() => _HomeGameChoicesState();
}

class _HomeGameChoicesState extends State<HomeGameChoices> with SingleTickerProviderStateMixin{

  AnimationController _controller ;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 1))..addListener((){
      setState(() {
        
      });
    })..addStatusListener((status){
      if(status == AnimationStatus.completed){
        
        _controller.reset();
        _controller.forward();
      }
    });
    animation = Tween<double>(begin: 0,end: 10).animate(_controller);
    _controller.forward();
    
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
           child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.only(left: animation.value),
                child: Image.asset(
                  "assets/forest-logo.png",
                  fit: BoxFit.contain,
                  width: 175,
                  height: 150,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left:animation.value),
                child: Icon(Icons.chevron_right,color: Colors.yellow,),
              )
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ForestMapActivity(),
              ),
            );
          },
        ),
        Divider(indent: 20,endIndent: 20,color: Colors.black38,),
        InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.only(left: animation.value),
                child: Image.asset(
                  "assets/sotflogo.png",
                  fit: BoxFit.cover,
                  width: 175,
                  height: 190,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left:animation.value),
                child: Icon(Icons.chevron_right,color: Colors.yellow,),
              )
            ],
          ),
          onTap: () {
            print("SONS OF THE FOREST");
          },
        ),
      ],
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose

    _controller.dispose();
    super.dispose();
  }
}
