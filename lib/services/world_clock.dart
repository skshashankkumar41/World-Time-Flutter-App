import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldClock{

  String location;
  String time;
  String flag;
  String url;
  bool isDaytime;

  WorldClock({this.location, this.flag, this.url});

  Future <void> getTime() async {

    try {
      print("Inside GetData()");
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);
      // get properties from json
      String datetime = data['datetime'];
      print("DATETIME::${data['datetime']}");
      print("OFFSET::${data['utc_offset']}");
      String hourOffset = data['utc_offset'].substring(1,3);
      String minOffset = data['utc_offset'].substring(4,6);
      //print(datetime);
      //print(offset);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(hourOffset),minutes: int.parse(minOffset)));
      isDaytime = now.hour >= 6 && now.hour <= 20 ? true : false;

      time = DateFormat.jm().format(now);
    }

    catch(e){
      print("Got ERROR");
      time = "Some Problem Occured";
    }


  }

}
