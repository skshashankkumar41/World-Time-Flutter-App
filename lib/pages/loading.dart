import 'package:flutter/material.dart';
import 'package:world_clock_app/services/world_clock.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "loading";

  void setUpWorldClock() async {
    WorldClock instance = WorldClock(url: 'Asia/Kolkata', flag:'ind.png', location:'Kolkata' );
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'time':instance.time,
      'flag': instance.flag,
      'dayTime':instance.isDaytime
    });
  }

  @override
  void initState() {
    //print("Inside Init");
    super.initState();
    setUpWorldClock();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        )
      ),
    );
  }
}
