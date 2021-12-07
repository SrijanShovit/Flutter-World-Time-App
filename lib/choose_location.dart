import 'package:flutter/material.dart';
import 'package:time_app/world_times.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);



  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  int counter=0;

  void updateTime(index)  async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDay' : instance.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    print ("Build ran");        //will run everytime widget is build
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        //AppBar automatically places a back arrow
        title: Text('Choose Location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                 backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            );
          }
      ),
      //body: RaisedButton(onPressed: ( ) {
      //   setState(()
      //   //rebuilds the widget
      //   {
      //     counter++;
      //   });
      // },
       // child: Text('counter is $counter'),

    );
  }
}
//Asynchronous code should be non blocking
//it would take some time to complete in future
