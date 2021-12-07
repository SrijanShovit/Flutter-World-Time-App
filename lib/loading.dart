import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'world_times.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

                      //time will be set to null if error is caught
  // void getTime () async {
  //  //Response object
  //   //Make Request
  //   Response response =await get(Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Kolkata'));
  //   Map data =jsonDecode (response.body);      //converting json to map
  //
  //   //get properties from data
  //   String datetime = data['datetime'];
  //   String offset = data['utc_offset'].substring(1,3);
  //   print (datetime);
  //   print (offset);
  //
  //   //create datetime object
  //   DateTime now = DateTime.parse(datetime);
  //   now = now.add(Duration(hours: int.parse(offset)));
  //   print (now);
  //
  //
  //   //async to allow wait
  //   //   //simulating network request for a username
  //   //   //await Future.delayed(Duration(seconds:3),(){           //wait for this code
  //   //   // print('Srijan');                    //delay for specified time and then fire the code in block
  //   //   String user = await Future.delayed(Duration(seconds:3),(){ return 'Shovit';});
  //   //   print (user);
  //   //
  //   //   //first return the value and then assign it
  //
  //   // //will execute first non blocking feature
  // }

  void setupWorldTime() async {
    WorldTime instance = WorldTime(url: 'Asia/Kolkata', flag: 'india.jpg', location: 'Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
    'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDay' : instance.isDay,
    });                  //now we don't have a stack of routes sitting underneath
    //named parameter arguments(map) tell what we want to send to next route

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();            //first run actual init method
    print ("InitState ran");        //will run only once the widget is initialised
    setupWorldTime();                    //asynchronous means it won't wait for its statements to execute
    // print('Hola');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
