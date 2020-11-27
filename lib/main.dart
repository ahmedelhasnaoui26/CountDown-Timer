
import 'package:countdown_timer/painter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  String get timer {
    Duration duration = _controller.duration * _controller.value;

    return '${(duration.inHours % 24).toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  AnimationController _controller;
  bool isPlay = false;
  //Map<String, int> data = {};
  //Map<String, int> data1 = {'seconds': 5};

  @override
  void initState() {
      //data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data1;
    super.initState();
    _controller = AnimationController(
        duration: Duration(hours: 0, minutes: 0, seconds: 30), vsync: this);

    _controller.addListener(() {
      print(_controller.value);
    });
    _controller.addListener(() {
      setState(() {
        print('timer is : $timer');
       
      });
      
    });
    _controller.addStatusListener((status) {
      print(status);
    });
    
  }

  
  @override
  Widget build(BuildContext context) {
    

    //print(data);
    
      //  print(data);
    return Scaffold(
      backgroundColor: Colors.black,
      
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(bottom: 0.0),
          child: Stack(
            children: [
              Center(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, _) {
                    return CustomPaint(
                      painter: Painter(
                          animation: _controller,
                          colorC: Colors.white,
                          colorA: Colors.red),
                    );
                  },
                ),
              ),
              Center(
                child: Text(
                  timer,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton.icon(
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      if (!_controller.isAnimating && _controller.isDismissed) {
                        _controller.forward();
                        isPlay = true;
                      } else {
                        _controller.reset();
                        isPlay = false;
                      }
                    });
                  },
                  icon: Icon(
                    isPlay ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 35,
                  ),
                  label: Text(
                    isPlay ? 'Reset' : 'Play',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
