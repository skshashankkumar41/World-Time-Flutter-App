import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    Color bgColor = data['dayTime'] ? Colors.lightBlueAccent[400] : Colors.blue[900];
    String img = data['dayTime'] ? 'day.jpg' : 'night.jpg';

    return Scaffold(
        backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$img'),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8,120,0,0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async {
                       dynamic result = await Navigator.pushNamed(context, '/location');
                       setState(() {
                         data = {
                           'time': result['time'],
                           'location': result['location'],
                           'flag': result['flag'],
                           'dayTime':result['dayTime']

                         };
                       });
                      },
                      icon:Icon(
                        Icons.edit_location,
                        color: Colors.grey[400],
                        size: 20.0,

                      ),
                      label: Text(
                        'Edit Location',
                        style: TextStyle(
                          color: Colors.grey[300],
                            fontSize: 15
                        ),
                      ),),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                      data['time'],
                      style: TextStyle(
                          fontSize: 66.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ],
              ),
            ),
          )
      )
    );
  }
}
