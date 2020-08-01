import 'package:flutter/material.dart';
import 'package:world_clock_app/services/world_clock.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldClock> locations = [
    WorldClock(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'ind.jpg'),
    WorldClock(url: 'Europe/London', location: 'London', flag: 'uk.jpg'),
    WorldClock(url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'usa.jpg'),
    WorldClock(url: 'Europe/Paris', location: 'Paris', flag: 'uk.jpg'),
    WorldClock(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.jpg'),
    WorldClock(url: 'America/Chicago', location: 'Chicago', flag: 'usa.jpg'),
    WorldClock(url: 'America/New_York', location: 'New York', flag: 'usa.jpg'),
    WorldClock(url: 'Asia/Seoul', location: 'Seoul', flag: 'korea.jpg'),

  ];

  void getClock(index) async {
    WorldClock instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location': instance.location,
      'time':instance.time,
      'flag': instance.flag,
      'dayTime':instance.isDaytime
    });
  }


  @override
  Widget build(BuildContext context) {
    print("Inside Build");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(
          itemBuilder: (context,index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical:2.0, horizontal: 5.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    getClock(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                )
              ),
            );
          },
          itemCount: locations.length,
      )


    );
  }
}
